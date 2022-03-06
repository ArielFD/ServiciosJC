import { io } from "socket.io-client";

const URL = "http://localhost:1337";
const socket = io(URL, { autoConnect: true });

export default socket;