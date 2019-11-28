import React from "react";
import ReactDOM from "react-dom";
// import { jsApp } from "./output/Example1.App";
// import { jsApp } from "./output/Example2.App";
// import { jsApp } from "./output/Example3.App";
// import { jsApp } from "./output/Example4.App";
// import { jsApp } from "./output/Example5.App";
// import { mkJsApp } from "./output/Example6.App";
import { mkJsApp } from "./output/Example7.App";
import "./index.scss";

/**
 * You can set `App` to `jsApp` to see the first few examples
 * For examples after Example5, a `mkJsApp` is exported, which
 * must be called (it is an "effect").
 */
// const App = jsApp;
const App = mkJsApp();

ReactDOM.render(<App />, document.getElementById("root"));
