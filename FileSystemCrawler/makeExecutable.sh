OUTPUT_DIR='output'

if [[ ! -e $OUTPUT_DIR ]]; then
	mkdir $OUTPUT_DIR
fi

xcrun -sdk macosx swiftc FileSystemCrawler/main.swift FileSystemCrawler/Crawl/Crawler.swift -o $OUTPUT_DIR/crawler
