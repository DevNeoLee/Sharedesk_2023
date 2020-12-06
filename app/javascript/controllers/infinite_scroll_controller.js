import { Controller } from "stimulus";

export default class extends Controller {
    static targets =[ "entries", "pagination"]

    scroll() {
        let next_page = this.paginationTarget.querySelector("a[rel='next']")
        if (next_page == null) { return }

        let url = next_page.href 
  
        var body = document.body,
            html = document.documentElement

        var height = Math.max(body.scrollHeight, body.offsetHeight, html.clientHeight, html.scrollHeight, html.offsetHeight)

            if (window.pageYOffset >= height - window.innerHeight - 300 ) {
                this.loadMore(url)
            }
    }

    loadMore(url) {
        $.ajax({
            method: 'GET',
            url: url, 
            dataType: 'json',
            success: (data) => {
                this.entriesTarget.insertAdjacentHTML('beforeend', data.entries)
                this.paginationTarget.innerHTML = data.pagination
            },
            error: (message) => {
                console.log('error')
                console.log(message)
            }
        })
    }
}

