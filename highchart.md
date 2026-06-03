# highchart

## Width hack
```
  // Highchart's viewport hack :
    // Highcharts does not handle well the display of charts in hidden containers (ex: in a tab),
    // and can have display issues on window resize.
    // To avoid this, we listen to window resize and update dynamically the chart size accordingly.

    useEffect(() => {
        window.addEventListener('resize', () => setViewportWidth(window.innerWidth))
    }, [])
    useEffect(() => {
        if (chartRef.current) {
            setChartWidth(chartRef.current.offsetWidth)
        }
    }, [viewportWidth])
    // Hack

    return <div ref={chartRef} className={`${className}`} style={{ width: '100%' }}>
        <HighchartsReact
            highcharts={Highcharts}
            options={{
                ...options,
                chart: {
                    ...options.chart,
                    reflow: true,
                    width: chartWidth,
                }
            }}
        />
    </div>
}
```
