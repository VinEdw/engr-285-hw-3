import numpy as np
rng = np.random.default_rng(seed=285)

# Swing and At-Bat Results
IN_FIELD_HIT = 0
FOUL_BALL = 1
STRIKEOUT = 3
WALK = 4
STRIKE = 2

def simulate_pitch(p_strikezone):
    """
    Return True if the pitch is thrown into the strikezone, and False otherwise.
    p_strikezone is the probability the pitch makes in into the strikezone.
    """
    return rng.random() < p_strikezone

def simulate_swing_decision(p_swing):
    """
    Return True if the batter swings at a pitch, and False otherwise.
    p_swing is the probability the batter swings.
    """
    return rng.random() < p_swing

def simulate_swing_result(p_results):
    """
    Return an integer representing the result of the swing.
    p_results is a list containing the probabilities of each possible result:
    - in-field hit
    - foul ball
    - strike
    """
    random_num = rng.random()
    if random_num < p_results[0]:
        return IN_FIELD_HIT
    elif random_num < p_results[0] + p_results[1]:
        return FOUL_BALL
    else:
        return STRIKE

def simulate_at_bat(p_strikezone=0.5, p_swing=0.5, p_strikezone_results=[0.4, 0.3, 0.3], p_not_strikezone_results=[0.15, 0.35, 0.50]):
    """
    Simulate an at-bat with the given probabilities.
    Return the outcome in a dictionary containing:
    - pitches
    - foul_balls
    - result (an integer representing an in-field hit, a strikeout, or a miss)
    - strikes
    - balls
    """
    strike_limit = 3
    ball_limit = 4

    strikes = 0
    balls = 0
    pitches = 0
    foul_balls = 0
    successful_hit = False

    while (strikes < strike_limit) and (balls < ball_limit) and not successful_hit:
        pitches += 1
        pitch_in_strikezone = simulate_pitch(p_strikezone)
        batter_swings = simulate_swing_decision(p_swing)
        if batter_swings:
            if pitch_in_strikezone:
                swing_result = simulate_swing_result(p_strikezone_results)
            else:
                swing_result = simulate_swing_result(p_not_strikezone_results)

            if swing_result == IN_FIELD_HIT:
                successful_hit = True
            elif swing_result == FOUL_BALL:
                foul_balls += 1
                if strikes < strike_limit - 1: strikes += 1
            else:
                strikes += 1
        elif pitch_in_strikezone:
            strikes += 1
        else:
            balls += 1

    if successful_hit:
        at_bat_result = IN_FIELD_HIT
    elif strikes == strike_limit:
        at_bat_result = STRIKEOUT
    else:
        at_bat_result = WALK

    outcome = {
        "pitches": pitches,
        "foul_balls": foul_balls,
        "result": at_bat_result,
        "strikes": strikes,
        "balls": balls,
    }

    return outcome

def calculate_outcome_probability(outcomes, result):
    """
    Given a list of at-bat outcomes, calculate the probability of a specific result.
    Possible results:
    - in-field hit
    - strikeout
    - walk
    """
    N = len(outcomes)
    count = 0
    for outcome in at_bat_outcomes:
        if outcome["result"] == result:
            count += 1
    return count / N

trials = 100
at_bat_outcomes = []
for _ in range(trials):
    outcome = simulate_at_bat()
    at_bat_outcomes.append(outcome)

avg_pitches = np.mean([outcome["pitches"] for outcome in at_bat_outcomes])
avg_foul_balls = np.mean([outcome["foul_balls"] for outcome in at_bat_outcomes])
p_in_field_hit = calculate_outcome_probability(at_bat_outcomes, IN_FIELD_HIT)
p_strikeout = calculate_outcome_probability(at_bat_outcomes, STRIKEOUT)
p_walk = calculate_outcome_probability(at_bat_outcomes, WALK)

print(f"Average number of pitches: {avg_pitches}")
print(f"Average number of foul balls: {avg_foul_balls}")
print(f"Overall probability of in-field hit: {p_in_field_hit:.0%}")
print(f"Overall probability of strikeout: {p_strikeout:.0%}")
print(f"Overall probability of walk: {p_walk:.0%}")
