import { html, render } from "lit-html";
import { icp_challenge_2_backend } from "declarations/icp-challenge-2-backend";
import logo from "./logo2.svg";

class App {
  userInfo = "";

  constructor() {
    this.#render();
  }

  #handleSubmit = async (e) => {
    e.preventDefault();
    const username = document.getElementById("name").value;
    this.userInfo = await icp_challenge_2_backend.get_github_user_info(
      username
    );
    this.#render();
  };

  #render() {
    let body = html`
      <main>
        <img src="${logo}" alt="DFINITY logo" />
        <br />
        <br />
        <form action="#">
          <label for="name">Enter GitHub username: &nbsp;</label>
          <input id="name" alt="Name" type="text" />
          <button type="submit">Get User Info</button>
        </form>
        <section id="userInfo">
          <pre>${this.userInfo}</pre>
        </section>
      </main>
    `;
    render(body, document.getElementById("root"));
    document
      .querySelector("form")
      .addEventListener("submit", this.#handleSubmit);
  }
}

export default App;
