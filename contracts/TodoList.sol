pragma solidity ^0.8.13;

contract TodoList {
    // Task structure to represent a single task
    struct Task {
        uint8 id;
        bytes32 content;
        bool isCompleted;
    }

    // Constructor to initialize the contract with default tasks
    constructor() {
        // Add default tasks during contract deployment
    }

    // Array to store all tasks
    Task[] public tasks;

    // Function to add a new task
    function addTask(bytes32 _content) public {
        uint8 taskId = uint8(tasks.length + 1);
        tasks.push(Task(taskId, _content, false));
    }

    // Function to mark a task as completed
    function markCompleted(uint8 _taskId) public {
        require(_taskId > 0 && _taskId <= tasks.length, "Invalid task ID");
        require(!tasks[_taskId - 1].isCompleted, "Task is already completed"); // Reason string added
        tasks[_taskId - 1].isCompleted = true;
    }

    // Function to get the total number of tasks
    function getTaskCount() public view returns (uint8) {
        return uint8(tasks.length);
    }

    // Function to get a specific task's details
    function getTask(uint8 _taskId) public view returns (Task memory) {
        require(_taskId > 0 && _taskId <= tasks.length, "Invalid task ID");
        return tasks[_taskId - 1];
    }
}