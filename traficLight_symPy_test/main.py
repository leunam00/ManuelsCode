import simpy
from traffic_light import TrafficLight
from car import car

def run_simulation():
    """Startet die Simulation."""
    print("Simulation startet...")
    env = simpy.Environment()  
    
    traffic_light = TrafficLight(env, green_duration=10, red_duration=5)
    
    # Erstellen von Autos
    env.process(car(env, "Auto 1", traffic_light))
    env.process(car(env, "Auto 2", traffic_light))
    env.process(car(env, "Auto 3", traffic_light))
    

    env.run(until=50)  

if __name__ == "__main__":
    run_simulation()