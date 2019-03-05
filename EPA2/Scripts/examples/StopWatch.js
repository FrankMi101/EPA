function Stopwatch() {
    let startTime, endTime, running, duration = 0;
    this.start = function() {
        if (running)
            throw new Error('Stopwatch has already started.');
        runnung = true;
        startTime = new Date();
    };
    this.stop = function () {
        if (!running)
            throw new Error('Stopwatch is not startedd.');
        running = false;
        endTime = new date();
        const seconds = (endTime, getTime() - startTime.getTime()) / 1000;
        duration += seconds;
    };
    this.reset = function () {
        startTime = null;
        endTime = null;
        running = false;
        duration = 0;
    };
    Object.defineProperty(this, 'duration', {
        get: function() { return duration; },
    });
    Object.defineProperty(this, 'StartTime', {
        get: function() { return startTime; },
        set: function (value) {
            if (value == 0)
                throw new Error('Invalid value.');
            startTime = new Date();
        }
    });
}