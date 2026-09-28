from fastapi import FastAPI, HTTPException
from pydantic import BaseModel
import base64, io, platform

app = FastAPI(title="Omnix Computer Host", version="0.2.0")
REQUIRE_APPROVAL = True
ALLOW_INSTALL = False
ALLOW_SHELL = False

class Action(BaseModel):
    type: str
    x: int | None = None
    y: int | None = None
    text: str | None = None
    key: str | None = None
    target: str | None = None
    command: str | None = None
    approved: bool = False

@app.get("/health")
def health():
    return {"ok": True, "service": "omnix-computer-host", "os": platform.system()}

@app.get("/computer/apps")
def apps():
    return {"ok": True, "apps": []}

@app.post("/computer/screenshot")
def screenshot():
    try:
        import mss
        from PIL import Image
        with mss.mss() as sct:
            monitor = sct.monitors[1] if len(sct.monitors) > 1 else sct.monitors[0]
            shot = sct.grab(monitor)
            image = Image.frombytes("RGB", shot.size, shot.rgb)
            buf = io.BytesIO()
            image.save(buf, format="PNG")
            return {"ok": True, "message": "Screenshot captured.", "screenshot": base64.b64encode(buf.getvalue()).decode("ascii")}
    except Exception as exc:
        raise HTTPException(status_code=500, detail=str(exc))

@app.post("/computer/action")
def action(action: Action):
    if REQUIRE_APPROVAL and action.type in {"install_app", "run_command"} and not action.approved:
        raise HTTPException(status_code=403, detail="Approval required.")
    if action.type in {"click", "double_click", "move", "type", "key", "scroll"}:
        try:
            import pyautogui
            if action.type == "click": pyautogui.click(action.x, action.y)
            elif action.type == "double_click": pyautogui.doubleClick(action.x, action.y)
            elif action.type == "move": pyautogui.moveTo(action.x, action.y)
            elif action.type == "type": pyautogui.write(action.text or "", interval=0.01)
            elif action.type == "key": pyautogui.press(action.key or "")
            elif action.type == "scroll": pyautogui.scroll(int(action.y or 0))
            return {"ok": True, "message": "Action executed."}
        except Exception as exc:
            raise HTTPException(status_code=500, detail=str(exc))
    if action.type == "screenshot": return screenshot()
    if action.type == "wait": return {"ok": True, "message": "Wait acknowledged."}
    if action.type == "open_app": raise HTTPException(status_code=403, detail="App launch requires a configured allowlist.")
    if action.type == "install_app" and not ALLOW_INSTALL: raise HTTPException(status_code=403, detail="App installation is disabled.")
    if action.type == "run_command" and not ALLOW_SHELL: raise HTTPException(status_code=403, detail="Shell access is disabled.")
    raise HTTPException(status_code=400, detail="Unsupported action: " + action.type)

if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="127.0.0.1", port=8765)
