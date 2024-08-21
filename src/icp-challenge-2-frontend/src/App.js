import { html, render } from "lit-html";
import { icp_challenge_2_backend } from "declarations/icp-challenge-2-backend";
import logo from "./logo2.svg";

class App {
  airQualityInfo = "";

  constructor() {
    this.#render();
  }

  #handleSubmit = async (e) => {
    e.preventDefault();
    const city = document.getElementById("city").value;
    this.airQualityInfo = await icp_challenge_2_backend.get_air_quality(city);
    this.#render();
  };

  #render() {
    let body = html`
      <main>
        <img src="${logo}" alt="App logo" />
        <br />
        <br />
        <form action="#">
          <label for="city">Enter city name: &nbsp;</label>
          <input id="city" alt="City" type="text" />
          <button type="submit">Get Air Quality</button>
        </form>
        <section id="airQualityInfo">
          <pre>${this.airQualityInfo}</pre>
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
