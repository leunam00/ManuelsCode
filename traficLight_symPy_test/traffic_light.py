import simpy

class TrafficLight:
    def __init__(self, env, green_duration=10, red_duration=5):
        self.env = env
        self.green_duration = green_duration
        self.red_duration = red_duration
        self.state = "RED"  # Anfangszustand 
        self.action = env.process(self.run())

    def run(self):
        while True:
            if self.state == "RED":
                print(f"Ampel ist ROT bei {self.env.now}")
                yield self.env.timeout(self.red_duration)  # Dauer des Rotlichts
                self.state = "GREEN"
            elif self.state == "GREEN":
                print(f"Ampel ist GRÜN bei {self.env.now}")
                yield self.env.timeout(self.green_duration)  # Dauer des Grünlichts
                self.state = "RED"