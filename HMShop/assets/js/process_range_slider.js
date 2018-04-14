function processConstructSlider(element) {
    var numberQuestion = getNumberQuestion();
    var numberResult = $('div.result').length;
    minValue = 0;
    maxValue = 100;
    if (numberQuestion == 1 && numberResult == 1) {
        addSlider($(element), [0, 100]);
        arrayElementSlider.push($(element));
        addAttributeSlider($(element), 1, 0, 100, "0-1");

    } else if (numberQuestion == 1 && numberResult > 1) {
        var valueForSlider = Math.ceil((maxValue - minValue) / numberResult);
        var lastValue = 0;

        // change value sliders currrent 
        for (i = 0; i < arrayElementSlider.length ; i++) {
            valueForSlider = Math.ceil((maxValue - minValue - lastValue) / (numberResult--));
            if (i == 0) {
                arrayElementSlider[i].slider("enable");
                arrayElementSlider[i].slider("values", [lastValue, lastValue + valueForSlider]);
                updateTooltip(arrayElementSlider[i], "0");
            } else {
                arrayElementSlider[i].slider("values", [lastValue + 1, lastValue + valueForSlider]);
                updateTooltip(arrayElementSlider[i], "NA correct");
            }
            lastValue = lastValue + valueForSlider;
        }
        // add new slider 
        addSlider($(element), [lastValue + 1, lastValue + valueForSlider]);
        arrayElementSlider.push($(element));
        addAttributeSlider($(element), arrayElementSlider.length, lastValue + 1, valueForSlider + lastValue, 1);
    } else if (numberQuestion > 1 && numberResult == 1) {
        addSlider($(element), [0, 100]);
        addAttributeSlider($(element), 1, 0, 100, "0-" + numberQuestion);
        $(element).slider("disable");
        arrayElementSlider.push($(element));
    } else {
        var valueForSlider = Math.ceil((maxValue - minValue) / numberResult);
        var scale = Math.ceil(100 / numberQuestion);
        var lastValue = 0;
        var lastValueSelect = [0, valueForSlider];
        var arrValueSelect = [0, 0];

        // change value sliders currrent 
        for (i = 0; i < arrayElementSlider.length ; i++) {
            valueForSlider = Math.ceil((maxValue - minValue - lastValue) / (numberResult--));
            var numberQuestionNew = getNumberQuestion();
            var numberResultNew = $('div.result').length;
            arrayElementSlider[i].slider("enable");

            // case 1 
            if (numberResultNew > (numberQuestionNew + 1)) {
                if (i == 0) {
                    updateTooltip(arrayElementSlider[i], "0");
                } else {
                    var snippet = 0;
                    var newSnippet = 0;
                    for (j = 1; j <= numberQuestionNew; j++) {
                        if ((lastValueSelect[0] <= scale * j) && (lastValueSelect[1] >= scale * j)) {
                            newSnippet = j;
                            break;
                        }
                    }
                    if (snippet == newSnippet) {
                        updateTooltip(arrayElementSlider[i], "NA correct");
                    } else {
                        if (newSnippet == numberQuestionNew) {
                            updateTooltip(arrayElementSlider[i], "NA correct");
                        } else {
                            updateTooltip(arrayElementSlider[i], j);
                        }
                    }
                    snippet = newSnippet;
                }

                arrValueSelect = [0, numberQuestionNew - 1];

                // case 2 
            } else if (numberResultNew == (numberQuestionNew + 1)) {
                if (i == 0) {
                    updateTooltip(arrayElementSlider[i], "0");
                } else {
                    updateTooltip(arrayElementSlider[i], i);
                }
                arrValueSelect = [0, numberQuestionNew - 1];
                // case 3
            } else {
                var minvl = null;
                var maxvl = null;
                var check = false; // check has satisfy condtion if
                for (j = 0; j <= numberQuestionNew; j++) {
                    var scalePercent = (j / numberQuestion) * 100;
                    if (scalePercent >= lastValueSelect[0] && scalePercent <= lastValueSelect[1]) {
                        if (minvl == null) {
                            minvl = j;
                        }
                        maxvl = j;
                        check = true;
                    }
                }
                arrValueSelect = [0, maxvl];
                if (!check) {
                    updateTooltip(arrayElementSlider[i], "NA correct");
                } else {
                    if (minvl == maxvl) {
                        updateTooltip(arrayElementSlider[i], minvl);
                    } else {
                        updateTooltip(arrayElementSlider[i], minvl + "-" + maxvl);
                    }
                }

            }
            // set value for slider 
            if (i == 0) {
                arrayElementSlider[i].slider("values", [lastValue, lastValue + valueForSlider]);
            } else {
                arrayElementSlider[i].slider("values", [lastValue + 1, lastValue + valueForSlider]);
            }
            lastValue = lastValue + valueForSlider;
            lastValueSelect = [lastValue + 1, lastValue + valueForSlider];
        }

        // add new slider 
        addSlider($(element), [lastValue + 1, lastValue + valueForSlider]);
        arrayElementSlider.push($(element));
        if ((arrValueSelect[1] + 1) == numberQuestionNew) {
            var numberElement = numberQuestionNew;
        } else {
            var numberElement = (arrValueSelect[1] + 1) + "-" + numberQuestionNew;
        }
        addAttributeSlider($(element), arrayElementSlider.length, lastValue + 1, valueForSlider + lastValue, numberElement);
    }

}

function resetSlider() {
    var numberQuestion = getNumberQuestion();

    var numberResult = $('div.result').length;
    minValue = 0;
    maxValue = 100;

    if (numberQuestion == 0) {
        var valueForSlider = Math.ceil((maxValue - minValue) / numberResult);
        var lastValue = 0;
        // change value sliders currrent 
        for (i = 0; i < arrayElementSlider.length ; i++) {
            valueForSlider = Math.ceil((maxValue - minValue - lastValue) / (numberResult--));
            if (i == 0) {
                arrayElementSlider[i].slider("enable");
                arrayElementSlider[i].slider("values", [lastValue, lastValue + valueForSlider]);
                updateTooltip(arrayElementSlider[i], "NA correct");
            } else {
                arrayElementSlider[i].slider("values", [lastValue + 1, lastValue + valueForSlider]);
                updateTooltip(arrayElementSlider[i], "NA correct");
            }
            lastValue = lastValue + valueForSlider;
        }
    }

    else if (numberQuestion == 1 && numberResult == 1) {
        arrayElementSlider[0].slider("values", [0, 100]);
        updateTooltip(arrayElementSlider[0], "0-1");

    } else if (numberQuestion == 1 && numberResult > 1) {
        var valueForSlider = Math.ceil((maxValue - minValue) / numberResult);
        var lastValue = 0;
        var numberSlider = arrayElementSlider.length;
        // change value sliders currrent 
        for (i = 0; i < arrayElementSlider.length ; i++) {
            valueForSlider = Math.ceil((maxValue - minValue - lastValue) / (numberResult--));
            if (i == 0) {
                arrayElementSlider[i].slider("enable");
                arrayElementSlider[i].slider("values", [lastValue, lastValue + valueForSlider]);
                updateTooltip(arrayElementSlider[i], "0");
            } else {
                arrayElementSlider[i].slider("values", [lastValue + 1, lastValue + valueForSlider]);
                if (i == (arrayElementSlider.length-1)) {
                    updateTooltip(arrayElementSlider[i], "1");
                } else {
                    updateTooltip(arrayElementSlider[i], "NA correct");
                }
            }
            lastValue = lastValue + valueForSlider;
        }

    } else if (numberQuestion > 1 && numberResult == 1) {
        arrayElementSlider[0].slider("values", [0, 100]);
        updateTooltip(arrayElementSlider[0], "0-" + numberQuestion);
    } else {
        var valueForSlider = Math.ceil((maxValue - minValue) / numberResult);
        var scale = Math.ceil(100 / numberQuestion);
        var lastValue = 0;
        var lastValueSelect = [0, valueForSlider];
        var arrValueSelect = [0, 0];

        // change value sliders currrent 
        for (i = 0; i < arrayElementSlider.length ; i++) {
            valueForSlider = Math.ceil((maxValue - minValue - lastValue) / (numberResult--));
            var numberQuestionNew = getNumberQuestion();
            var numberResultNew = $('div.result').length;
            arrayElementSlider[i].slider("enable");

            // case 1 
            if (numberResultNew > (numberQuestionNew + 1)) {
                if (i == 0) {
                    updateTooltip(arrayElementSlider[i], "0");
                } else {
                    var snippet = 0;
                    var newSnippet = 0;
                    for (j = 1; j <= numberQuestionNew; j++) {
                        if ((lastValueSelect[0] <= scale * j) && (lastValueSelect[1] >= scale * j)) {
                            newSnippet = j;
                            break;
                        }
                    }
                    if (snippet == newSnippet) {
                        updateTooltip(arrayElementSlider[i], "NA correct");
                    } else {
                        if (newSnippet == numberQuestionNew) {
                            updateTooltip(arrayElementSlider[i], "NA correct");
                        } else {
                            updateTooltip(arrayElementSlider[i], j);
                        }
                    }
                    snippet = newSnippet;
                }

                arrValueSelect = [0, numberQuestionNew - 1];

                // case 2 
            } else if (numberResultNew == (numberQuestionNew + 1)) {
                if (i == 0) {
                    updateTooltip(arrayElementSlider[i], "0");
                } else {
                    updateTooltip(arrayElementSlider[i], i);
                }
                arrValueSelect = [0, numberQuestionNew - 1];
                // case 3
            } else {
                var minvl = null;
                var maxvl = null;
                var check = false; // check has satisfy condtion if
                for (j = 0; j <= numberQuestionNew; j++) {
                    var scalePercent = (j / numberQuestion) * 100;
                    if (scalePercent >= lastValueSelect[0] && scalePercent <= lastValueSelect[1]) {
                        if (minvl == null) {
                            minvl = j;
                        }
                        maxvl = j;
                        check = true;
                    }
                }
                arrValueSelect = [0, maxvl];
                if (!check) {
                    updateTooltip(arrayElementSlider[i], "NA correct");
                } else {
                    if (minvl == maxvl) {
                        updateTooltip(arrayElementSlider[i], minvl);
                    } else {
                        updateTooltip(arrayElementSlider[i], minvl + "-" + maxvl);
                    }
                }

            }
            // set value for slider 
            if (i == 0) {
                arrayElementSlider[i].slider("values", [lastValue, lastValue + valueForSlider]);
            } else {
                arrayElementSlider[i].slider("values", [lastValue + 1, lastValue + valueForSlider]);
            }
            lastValue = lastValue + valueForSlider;
            lastValueSelect = [lastValue + 1, lastValue + valueForSlider];
        }
    }
}

function addSlider(element, value) {
    element.slider({
        range: true,
        min: 0,
        max: 100,
        animate: "slow",
        values: value,
        slide: function (event, ui) {
            return checkConditionSlider($(element), event, ui);
        },
        change: function (event, ui) {
            updateTitle($(element));
            return checkConditionSlider($(element), event, ui);
        }, stop: function (event, ui) {
            processUpdateSlide($(element));
        },
        start: function (event, ui) {

            var index = $(element).find('div:nth-child(1)').attr("index");
            if ($(ui.handle).attr("left") == 0) {
                if (index == arrayElementSlider.length) {
                    return false;
                }
            }
            if ($(ui.handle).attr("left") == 1) {
                if (index == 1) {
                    return false;
                }
            }
        }
    });
}

function addAttributeSlider(element, index, min, max, tooltip) {
    element.find('div:nth-child(1)').attr("index", index);
    element.find('div:nth-child(1)').append('<div class="slide-range-tooltip"><div id="tooltip-slider" class="slide-range-tooltip__msg">' + tooltip + '</div><div class="slide-range-tooltip__arrow"></div></div>');
    element.find('a.ui-slider-handle:nth-child(2)').attr("left", 1).append("<span class='min-value-slider'>" + min + "%</span>");
    element.find('a.ui-slider-handle:nth-child(3)').attr("left", 0).append("<span class='max-value-slider'>" + max + "%</span>");
}

function checkConditionSlider(element, event, ui) {

    var index = $(ui.handle).siblings('a').andSelf().index(ui.handle);
    var values = $(element).slider('values');
    var checkOverlap = (index == 0 || ui.value > values[index - 1]) &&
       (index == values.length - 1 || ui.value < values[index + 1]);
    if (!checkOverlap) {
        return checkOverlap;
    }
    var index = element.find(":first-child").attr("index");
    left = (index - 1) * 2;
    var arraySliderLength = arrayElementSlider.length;
    var right = (arraySliderLength - index) * 2;
    var checkMaxValue = ((values[0] - left) > 0) || ((values[1] + right) < 100);
    if (!checkMaxValue) {
        if (ui.value > values[1] || ui.value < left) {
            return false;
        }
    }
    return true;

}

function updateTitle(element) {
    if (element.selector == ".range_result_slider") {
        e = $('#result-origin-personality').find('.range_result_slider');
    } else {
        e = $(element.selector);
    }
    var value = e.slider("values");
    var left = e.find('a.ui-slider-handle:nth-child(2)');
    var right = e.find('a.ui-slider-handle:nth-child(3)');
    $(left).find('span').text(value[0] + "%");
    $(right).find('span').text(value[1] + "%");
}

function updateTooltip(element, value) {
    $(element).find('div:nth-child(1)').find(".slide-range-tooltip").find(".slide-range-tooltip__msg").text(value);
}

function processUpdateSlide(e) {

    var numberQuestion = getNumberQuestion();
    var numberResult = $('div.result').length;
    if (numberResult == 1 && numberQuestion == 1) {

        updateTooltip(e, "0-1");

        // case 2
    } else if (numberQuestion == 1 && numberResult > 1) {

        updateMultiSlider(e, false, numberQuestion, numberResult);
        // case 3 
    } else if (numberResult == 1 && numberQuestion > 1) {

        updateTooltip(e, "0-" + numberQuestion);

        // case 4 
    } else {

        updateMultiSlider(e, true, numberQuestion, numberResult);
    }// end else 
}

function updateMultiSlider(e, tooltip, numberQuestion, numberResult) {

    var arraySliderLength = arrayElementSlider.length;
    var index = e.find(":first-child").attr("index");
    value = $(e).slider("values");
    if (index == 1) {
        lastValue = value;
        if (tooltip) {
            updateTooltip(arrayElementSlider[0], getToolTipByScale(lastValue));
        }
        for (i = 1; i < arraySliderLength; i++) {
            val = arrayElementSlider[i].slider("values");
            if (lastValue[1] >= val[0] && lastValue[1] > val[1]) {
                arrayElementSlider[i].slider("values", [lastValue[1] + 1, lastValue[1] + 2]);
                lastValue = [lastValue[0], lastValue[1] + 2];

            } else {
                arrayElementSlider[i].slider("values", [lastValue[1] + 1, val[1]]);
                lastValue = [lastValue[0], val[1]];

            }
            if (tooltip) {
                updateTooltip(arrayElementSlider[i], getToolTipByScale(arrayElementSlider[i].slider("values")));
            }
        }


    } else if (index == arraySliderLength) {
        lastValue = value[0];
        if (tooltip) {
            updateTooltip(arrayElementSlider[arraySliderLength - 1], getToolTipByScale(arrayElementSlider[arraySliderLength - 1].slider("values")));
        }
        var total = (arraySliderLength - 2);
        for (i = total ; i >= 0  ; i--) {
            val = arrayElementSlider[i].slider("values");
            if (val[1] >= lastValue && lastValue < val[0]) {
                arrayElementSlider[i].slider("values", [lastValue - 2, lastValue - 1]);
                lastValue = lastValue - 2;
            } else {
                arrayElementSlider[i].slider("values", [val[0], lastValue - 1]);
                lastValue = val[0];
            }
            if (tooltip) {
                updateTooltip(arrayElementSlider[i], getToolTipByScale(arrayElementSlider[i].slider("values")));
            }
        }

    } else {
        if (tooltip) {
            updateTooltip(arrayElementSlider[index - 1], getToolTipByScale(arrayElementSlider[index - 1].slider("values")));
        }
        lastValue = value[0];
        for (i = (index - 2) ; i >= 0 ; i--) {
            val = arrayElementSlider[i].slider("values");
            if (val[1] >= lastValue && lastValue < val[0]) {
                arrayElementSlider[i].slider("values", [lastValue - 2, lastValue - 1]);
                lastValue = lastValue - 2;
            } else {
                arrayElementSlider[i].slider("values", [val[0], lastValue - 1]);
                lastValue = val[0];
            }
            if (tooltip) {
                updateTooltip(arrayElementSlider[i], getToolTipByScale(arrayElementSlider[i].slider("values")));
            }
        }
        value = e.slider("values");
        lastValue = value[1];
        for (i = index ; i < arraySliderLength; i++) {
            val = arrayElementSlider[i].slider("values");
            if (val[0] <= lastValue && val[1] < lastValue) {
                arrayElementSlider[i].slider("values", [lastValue + 1, lastValue + 2]);
                lastValue = lastValue + 2;
            } else {
                arrayElementSlider[i].slider("values", [lastValue + 1, val[1]]);
                lastValue = val[1];
            }
            if (tooltip) {
                updateTooltip(arrayElementSlider[i], getToolTipByScale(arrayElementSlider[i].slider("values")));
            }
        }
    }

}

function getToolTipByScale(lastValueSelect) {

    var numberQuestion = getNumberQuestion();
    var minvl = null;
    var maxvl = null;
    var check = false; // check has satisfy condtion if
    for (j = 0; j <= numberQuestion; j++) {
        var scalePercent = (j / numberQuestion) * 100;
        if (scalePercent >= lastValueSelect[0] && scalePercent <= lastValueSelect[1]) {
            if (minvl == null) {
                minvl = j;
            }
            maxvl = j;
            check = true;
        }
    }
    if (!check) {
        return "NA correct";
    } else {
        if (minvl == maxvl) {
            return minvl;
        } else {
            return minvl + "-" + maxvl;
        }
    }
}

function getNumberQuestion() {
    if ($('#type').val() == 3) {
        var length = 0;
        $('div.question').eq(0).find("div.tab-pane").each(function (index, e) {
            if ($(e).hasClass("active")) {
                length = $(e).children().length - 1;
            }
        });
        var element = $('div.question').eq(0).find('div.tab-content').find('div.active');
        if (element.is(":visible")) {
            length = $(element).children().length - 1;
            return length;
        }
        return 0;
    } else {
        return $('div.question').length;
    }
}