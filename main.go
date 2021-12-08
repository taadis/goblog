package main

import (
	"flag"
	"log"
	"net/http"

	"github.com/taadis/goblog/conf"
	"github.com/taadis/goblog/internal/pkg/mysql"
	"github.com/taadis/goblog/internal/routers"
	logger "github.com/taadis/goblog/pkg/log"
	"github.com/taadis/goblog/pkg/redis"
)

var (
	cfgFile string
)

func main() {
	defer func() {
		if err := recover(); err != nil {
			log.Println(err)
		}
	}()

	flag.StringVar(&cfgFile, "config", "./conf/dev.yml", "config file path")
	flag.Parse()

	// init config
	cfg := conf.Init(cfgFile)

	// init logger
	logger.Init(&cfg.Logger)

	// init redis
	redis.Init(&cfg.Redis)

	// init orm
	//model.Init(&cfg.ORM)

	// init mysql
	mysql.Init(&cfg.Mysql)

	// init elasticsearch
	//if !cfg.Elasticsearch.Disable {
	//	es.Init(&cfg.Elasticsearch)
	//}

	addr := cfg.App.Addr
	log.Println("start serve: [", addr, "]")
	srv := &http.Server{
		Addr:    addr,
		Handler: routers.InitRouter(),
	}
	if err := srv.ListenAndServe(); err != nil {
		log.Println("server run error:", err)
	}

}
