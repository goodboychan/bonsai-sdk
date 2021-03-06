inkling "2.0"

using Number
experiment {
    num_workers: "3",
    env_runners_per_sampler: "10"
}

type GameState {
    x_position: number,
    x_velocity: number
}

type Action {
    command: Number.Int8<Left = 0, Stop = 1, Right = 2>
}

type MountainCarConfig {
    episode_length: -1,
    deque_size: 1
}

simulator MountainCarSimulator(action: Action, config: MountainCarConfig): GameState {
}

graph (input: GameState): Action {
    concept HighScore(input): Action {
        experiment {
            max_step_per_concept: "1000000"
        }
        curriculum {
            source MountainCarSimulator
        }
    }
    output HighScore
}
