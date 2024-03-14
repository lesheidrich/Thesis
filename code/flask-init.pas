    def __init__(self):
	# non-interactive rendering env
        matplotlib.use('Agg')  
        self.app = Flask(__name__)
        self.app.config['TIMEOUT'] = 500
        self.log = Logger(log_file="application_log.log",
                          name="FLASK HOST",
                          log_level="INFO")