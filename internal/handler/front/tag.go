package front

import (
	"net/http"

	"github.com/taadis/goblog/internal/pkg/mysql"
	"github.com/taadis/goblog/internal/pkg/view"
)

func Tag(w http.ResponseWriter, r *http.Request) {
	tags, _ := mysql.GetTags()
	data := make(map[string]interface{})
	data["title"] = "标签"
	data["description"] = "佛语的标签"
	data["tags"] = tags
	view.Render(data, w, "tag")
}
