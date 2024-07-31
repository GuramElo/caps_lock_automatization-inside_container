const { exec } = require("child_process");
async function pressCapsLock() {
  return await new Promise((res, rej) => {
    exec("xdotool key Caps_Lock", (error, stdout, stderr) => {
      if (error) {
        console.error(`Error: ${error.message}`);
        return rej(error.message);
      }
      return res(null);
    });
  });
}

setInterval(async () => {
  await pressCapsLock();
}, 5000)
