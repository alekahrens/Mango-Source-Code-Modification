package com.serotonin.mango.vo.report;

import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.Serializable;

import com.serotonin.util.SerializationHelper;

public class ReportPointVO implements Serializable {
    private int pointId;
    private String colour;
    private boolean consolidatedChart;
    private boolean scatterPlot;
    private String chartTitle;
    private String xAxisTitle;
    private String yAxisTitle;
    private int yReferenceLine;

    public int getPointId() {
        return pointId;
    }

    public void setPointId(int pointId) {
        this.pointId = pointId;
    }

    public String getColour() {
        return colour;
    }

    public void setColour(String colour) {
        this.colour = colour;
    }

    public boolean isConsolidatedChart() {
        return consolidatedChart;
    }

    public void setConsolidatedChart(boolean consolidatedChart) {
        this.consolidatedChart = consolidatedChart;
    }

    public boolean isScatterPlot(){
        return scatterPlot;
    }

    public void setScatterPlot(boolean scatterPlot){
        this.scatterPlot = scatterPlot;
    }

    public String getChartTile(){
        return chartTitle;
    }

    public void setChartTitle(String chartTitle){
        this.chartTitle = chartTitle;
    }

    public String getXAxisTitle(){
        return xAxisTitle;
    }

    public void setXAxis(String xAxisTitle){
        this.xAxisTitle = xAxisTitle;
    }

    public String getYAxisTitle(){
        return yAxisTitle;
    }

    public void setYAxisTitle(String yAxisTitle){
        this.yAxisTitle = yAxisTitle;
    }

    public int getYReferenceLine(){
        return yReferenceLine;
    }

    public void setYReferenceLine(int yReferenceLine){
        this.yReferenceLine = yReferenceLine;
    }

    //
    //
    // Serialization
    //
    private static final long serialVersionUID = -1;
    private static final int version = 2;

    private void writeObject(ObjectOutputStream out) throws IOException {
        out.writeInt(version);

        out.writeInt(pointId);
        SerializationHelper.writeSafeUTF(out, colour);
        out.writeBoolean(consolidatedChart);
    }

    private void readObject(ObjectInputStream in) throws IOException {
        int ver = in.readInt();

        // Switch on the version of the class so that version changes can be elegantly handled.
        if (ver == 1) {
            pointId = in.readInt();
            colour = SerializationHelper.readSafeUTF(in);
            consolidatedChart = true;
        }
        else if (ver == 2) {
            pointId = in.readInt();
            colour = SerializationHelper.readSafeUTF(in);
            consolidatedChart = in.readBoolean();
        }
    }
}
