import net.http
import net.html

fn main() {
	// http.fetch() sends an HTTP request to the URL with the given method and configurations.
	config := http.FetchConfig{
		user_agent: 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:88.0) Gecko/20100101 Firefox/88.0'
	}
	resp := http.fetch(http.FetchConfig{ ...config, url: 'https://tuicool.com' }) or {
		println('failed to fetch data from the server')
		return
	}
	// html.parse() parses and returns the DOM from the given text.
	mut doc := html.parse(resp.text)
	// html.DocumentObjectModel.get_tag_by_attribute_value() retrieves all the tags in the document that has the given attribute name and value.
	tags := doc.get_tag_by_attribute_value('class', 'list_article_item')
	for tag in tags {
		href := tag.children[0].attributes['href'] or { panic('key not found') }
		title := tag.children[0].attributes['title'] or { panic('key not found') }
		println('href: $href')
		println('title: $title')
		println('')
	}
}
