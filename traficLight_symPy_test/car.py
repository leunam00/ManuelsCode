import simpy

def car(env, name, traffic_light):
    print(f"{name} ist an der Ampel bei {env.now}")
    
    while True:
        # Warten, bis die Ampel grün wird
        if traffic_light.state == "GREEN":
            print(f"{name} fährt bei {env.now}")
            yield env.timeout(1)  # Auto fährt eine Zeiteinheit
        else:
            yield env.timeout(1)  # Auto wartet auf Grün