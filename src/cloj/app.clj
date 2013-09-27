(ns cloj.app
  (:require [ring.adapter.jetty :as jetty]                                  
            [cloj.handler :as handler])
  (:gen-class))

(defn -main [& args]
  (jetty/run-jetty handler/app {:port 3030 }))
