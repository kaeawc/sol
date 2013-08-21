all:
	coffee --output ./public/js/ --compile ./private/coffee/
	stylus -o ./public/css/ -c ./private/stylus/main.styl
