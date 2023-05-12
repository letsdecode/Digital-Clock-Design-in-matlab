%This is a function which creates a digital clock and date using seven segment display
%   This program generates a digital Clock.
%   Displays the TIME AND DATE according to the laptop's current Timings.
%   08-Apr-2020, letsdecodesjs@gmail.com
%
clear
clc
close all
%% Seven Segment Display Consruction
    % For Date
            % Patch coordinates for digits
                % Date section, left digit
                disp(1).topcenter1 = [0 5 4 1 0;0 0 -1 -1 0];
                disp(1).midcenter1 = [0 0.5 4.5 5 4.5 0.5 0;-6 -5.5 -5.5 -6 -6.5 -6.5 -6];
                disp(1).botcenter1 = [0 1 4 5 0;-12 -11 -11 -12 -12];
                disp(1).topleft1 = [0 1 1 0 0;-0.5 -1.5 -4.5 -5.5 -0.5];
                disp(1).botleft1 = [0 1 1 0 0;-6.5 -7.5 -10.5 -11.5 -6.5];
                disp(1).topright1 = [5 5 4 4 5;-0.5 -5.5 -4.5 -1.5 -0.5];
                disp(1).botright1 = [5 5 4 4 5;-6.5 -11.5 -10.5 -7.5 -6.5];
                disp_increment1 = [0 6 14 20 28 34 40 46];
                % Defining patch coordinates for all other digits based on the first digit
                for i = 2:8 
                    disp(i) = disp(1);
                    disp(i).topcenter1(1,:) = disp(i).topcenter1(1,:) + disp_increment1(i);
                    disp(i).midcenter1(1,:) = disp(i).midcenter1(1,:) + disp_increment1(i);
                    disp(i).botcenter1(1,:) = disp(i).botcenter1(1,:) + disp_increment1(i);
                    disp(i).topleft1(1,:) = disp(i).topleft1(1,:) + disp_increment1(i);
                    disp(i).botleft1(1,:) = disp(i).botleft1(1,:) + disp_increment1(i);
                    disp(i).topright1(1,:) = disp(i).topright1(1,:) + disp_increment1(i);
                    disp(i).botright1(1,:) = disp(i).botright1(1,:) + disp_increment1(i);
                end
            % Create circles to seperate date/month/year
            R = 0.5;
            theta = 0;
            i = 1;
            n = 72;
            circle = zeros(8,71);
            while theta <= 2 * pi - 0.1
                circle(1,i) = R * cos(theta) + 12.5;
                circle(2,i) = R * sin(theta) - 3.5;
                theta = theta + ( 2* pi) / n;
                i = i + 1;
            end
            circle(3,:) = circle(1,:);
            circle(4,:) = circle(2,:) - 5;
            circle(5,:) = circle(1,:) + 14;
            circle(6,:) = circle(2,:);
            circle(7,:) = circle(5,:);
            circle(8,:) = circle(4,:);
            % Create patches for display
                % Open figure window
                h = figure('Name','Date & Time','NumberTitle','off');
                set(h,'Color',[1 1 1],'OuterPosition',[0 0 450 265],'Resize','off')
                axes('Position',[0.075 0.45 0.75 0.5]) 
                count = 1;
                % Create patches for digits
                for i = 1:8
                    digit1(count) = patch(disp(i).topcenter1(1,:),disp(i).topcenter1(2,:),'r','EdgeAlpha',0);
                    count = count + 1;
                    digit1(count) = patch(disp(i).midcenter1(1,:),disp(i).midcenter1(2,:),'r','EdgeAlpha',0);
                    count = count + 1;
                    digit1(count) = patch(disp(i).botcenter1(1,:),disp(i).botcenter1(2,:),'r','EdgeAlpha',0);
                    count = count + 1;
                    digit1(count) = patch(disp(i).topleft1(1,:),disp(i).topleft1(2,:),'r','EdgeAlpha',0);
                    count = count + 1;
                    digit1(count) = patch(disp(i).botleft1(1,:),disp(i).botleft1(2,:),'r','EdgeAlpha',0);
                    count = count + 1;
                    digit1(count) = patch(disp(i).topright1(1,:),disp(i).topright1(2,:),'r','EdgeAlpha',0);
                    count = count + 1;
                    digit1(count) = patch(disp(i).botright1(1,:),disp(i).botright1(2,:),'r','EdgeAlpha',0);
                    count = count + 1;
                end
    % For Time
            % Patch coordinates for digits
                % Hour section, left digit
                disp(1).topcenter = [0 5 4 1 0;0 0 -1 -1 0];
                disp(1).midcenter = [0 0.5 4.5 5 4.5 0.5 0;-6 -5.5 -5.5 -6 -6.5 -6.5 -6];
                disp(1).botcenter = [0 1 4 5 0;-12 -11 -11 -12 -12];
                disp(1).topleft = [0 1 1 0 0;-0.5 -1.5 -4.5 -5.5 -0.5];
                disp(1).botleft = [0 1 1 0 0;-6.5 -7.5 -10.5 -11.5 -6.5];
                disp(1).topright = [5 5 4 4 5;-0.5 -5.5 -4.5 -1.5 -0.5];
                disp(1).botright = [5 5 4 4 5;-6.5 -11.5 -10.5 -7.5 -6.5];
                disp_increment = [0 6 14 20 28 34];
                % Defines patch coordinates for all other digits based on the first digit
                for i = 2:6
                    disp(i) = disp(1);
                    disp(i).topcenter(1,:) = disp(i).topcenter(1,:) + disp_increment(i);
                    disp(i).midcenter(1,:) = disp(i).midcenter(1,:) + disp_increment(i);
                    disp(i).botcenter(1,:) = disp(i).botcenter(1,:) + disp_increment(i);
                    disp(i).topleft(1,:) = disp(i).topleft(1,:) + disp_increment(i);
                    disp(i).botleft(1,:) = disp(i).botleft(1,:) + disp_increment(i);
                    disp(i).topright(1,:) = disp(i).topright(1,:) + disp_increment(i);
                    disp(i).botright(1,:) = disp(i).botright(1,:) + disp_increment(i);
                end
                % Create circles to separate hours/minutes/seconds
                for i = 1:4
                   circle(i) = patch(circle(i * 2 - 1,:),circle(i * 2,:),'r','EdgeAlpha',0); 
                end
                % Define axis coordinates, scale and figure properties
                axis equal
                axis([-1 60 -13 1])
                set(gca,'XTick',[],'YTick',[],'XColor',[1 1 1],'YColor',[1 1 1],'ZColor',[1 1 1])
                % Create circles to seperate hours/minutes/seconds
                R = 0.5;
                theta = 0;
                i = 1;
                n = 72;
                circle = zeros(8,71);
                while theta <= 2 * pi - 0.1
                    circle(1,i) = R * cos(theta) + 12.5;
                    circle(2,i) = R * sin(theta) - 3.5;
                    theta = theta + ( 2* pi) / n;
                    i = i + 1;
                end
                circle(3,:) = circle(1,:);
                circle(4,:) = circle(2,:) - 5;
                circle(5,:) = circle(1,:) + 14;
                circle(6,:) = circle(2,:);
                circle(7,:) = circle(5,:);
                circle(8,:) = circle(4,:);
                % Patches for display
                    % Open figure window
                    %h = figure('Name','Date & Time','NumberTitle','off');
                    set(h,'Color',[1 1 1],'OuterPosition',[200 300 450 265],'Resize','on')
                    axes('Position',[0.025 0.015 0.75 0.5]) 
%                     text(.1,12.5,['DIGITAL'])
%                     text(9,12.5,['CLOCK'])
%                     uicontrol('style','pushbutton',...
%                     'string','Close',...
%                     'position',[350 75 85 25],...
%                     'callback','close');
                    count = 1;
                    % Create patches for digits
                    for i = 1:6
                        digit(count) = patch(disp(i).topcenter(1,:),disp(i).topcenter(2,:),'b','EdgeAlpha',0);
                        count = count + 1;
                        digit(count) = patch(disp(i).midcenter(1,:),disp(i).midcenter(2,:),'b','EdgeAlpha',0);
                        count = count + 1;
                        digit(count) = patch(disp(i).botcenter(1,:),disp(i).botcenter(2,:),'b','EdgeAlpha',0);
                        count = count + 1;
                        digit(count) = patch(disp(i).topleft(1,:),disp(i).topleft(2,:),'b','EdgeAlpha',0);
                        count = count + 1;
                        digit(count) = patch(disp(i).botleft(1,:),disp(i).botleft(2,:),'b','EdgeAlpha',0);
                        count = count + 1;
                        digit(count) = patch(disp(i).topright(1,:),disp(i).topright(2,:),'b','EdgeAlpha',0);
                        count = count + 1;
                        digit(count) = patch(disp(i).botright(1,:),disp(i).botright(2,:),'b','EdgeAlpha',0);
                        count = count + 1;
                    end
                    % Create circles to separate hours/minutes/seconds
                    for i = 1:4
                       circle(i) = patch(circle(i * 2 - 1,:),circle(i * 2,:),'b','EdgeAlpha',0); 
                    end
                    % Define axis coordinates, scale and figure properties
                    axis equal
                    axis([-1 40 -13 1])
                    set(gca,'XTick',[],'YTick',[],'XColor',[1 1 1],'YColor',[1 1 1],'ZColor',[1 1 1])
% Operation of Date
        C = clock; 
        for i = 1:56
            set(digit1(i),'FaceAlpha',1)
        end
        
    % Determining date digits
    cur_digit1(1) = floor(C(3) / 10);
    cur_digit1(2) = C(3) - (cur_digit1(1) * 10);
    % Determining month digits
    cur_digit1(3) = floor(C(2) / 10);
    cur_digit1(4) = C(2) - (cur_digit1(3) * 10);
    % Determining year digits
    cur_digit1(5) = floor(C(1) / 1000);
    cur_digit1(6) = ((floor(C(1) / 100))-(cur_digit1(5)*10));
    cur_digit1(7) = ((floor(C(1) / 10)) - ((cur_digit1(5) * 100)+(cur_digit1(6) * 10)));
    cur_digit1(8) = (C(1) - ((cur_digit1(5) * 1000)+(cur_digit1(6) * 100)+(cur_digit1(7) * 10)));
    
    % Update digits to display time by reducing opacity of sections which do no need to be displayed
    for i = 1:8
        if cur_digit1(i) == 1
            set(digit1(-6 + (i * 7):-2 + (i * 7)),'FaceAlpha',0)
        elseif cur_digit1(i) == 2
            set(digit1(-3 + (i * 7)),'FaceAlpha',0)
            set(digit1(i * 7),'FaceAlpha',0)
        elseif cur_digit1(i) == 3
            set(digit1(-3 + (i * 7):-2 + (i * 7)),'FaceAlpha',0)
        elseif cur_digit1(i) == 4
            set(digit1(-6 + (i * 7)),'FaceAlpha',0)
            set(digit1(-4 + (i * 7)),'FaceAlpha',0)
            set(digit1(-2 + (i * 7)),'FaceAlpha',0)
        elseif cur_digit1(i) == 5
            set(digit1(-2 + (i * 7):-1 + (i * 7)),'FaceAlpha',0)
        elseif cur_digit1(i) == 6
            set(digit1(-1 + (i * 7)),'FaceAlpha',0)
        elseif cur_digit1(i) == 7
            set(digit1(-5 + (i * 7):-2 + (i * 7)),'FaceAlpha',0)
        elseif cur_digit1(i) == 9
            set(digit1(-2 + (i * 7)),'FaceAlpha',0)
        elseif cur_digit1(i) == 0
            set(digit1(-5 + (i * 7)),'FaceAlpha',0)
        end
    end
% Operation of Time (Loop to update time)
    count = 1;
    while count ~= 0
        C = clock;
        % Reset digit opacity to full    
        for i = 1:42
                set(digit(i),'FaceAlpha',1)
        end
        
        % Determining hour digits
        cur_digit(1) = floor(C(4) / 10);
        cur_digit(2) = C(4) - (cur_digit(1) * 10);
        % Determining minute digits
        cur_digit(3) = floor(C(5) / 10);
        cur_digit(4) = C(5) - (cur_digit(3) * 10);
        % Determining second digits
        C(6) = round(C(6));
        cur_digit(5) = floor(C(6) / 10);
        cur_digit(6) = C(6) - (cur_digit(5) * 10);
        if cur_digit(5) == 6
            cur_digit(5) = 0;
        end
        % Update digits to display time by reducing opacity of sections which do no need to be displayed
        for i = 1:6
            if cur_digit(i) == 1
                set(digit(-6 + (i * 7):-2 + (i * 7)),'FaceAlpha',0)
            elseif cur_digit(i) == 2
                set(digit(-3 + (i * 7)),'FaceAlpha',0)
                set(digit(i * 7),'FaceAlpha',0)
            elseif cur_digit(i) == 3
                set(digit(-3 + (i * 7):-2 + (i * 7)),'FaceAlpha',0)
            elseif cur_digit(i) == 4
                set(digit(-6 + (i * 7)),'FaceAlpha',0)
                set(digit(-4 + (i * 7)),'FaceAlpha',0)
                set(digit(-2 + (i * 7)),'FaceAlpha',0)
            elseif cur_digit(i) == 5
                set(digit(-2 + (i * 7):-1 + (i * 7)),'FaceAlpha',0)
            elseif cur_digit(i) == 6
                set(digit(-1 + (i * 7)),'FaceAlpha',0)
            elseif cur_digit(i) == 7
                set(digit(-5 + (i * 7):-2 + (i * 7)),'FaceAlpha',0)
            elseif cur_digit(i) == 9
                set(digit(-2 + (i * 7)),'FaceAlpha',0)
            elseif cur_digit(i) == 0
                set(digit(-5 + (i * 7)),'FaceAlpha',0)
            end
        end
        % Make dots flash on every alternate second
                if (cur_digit(6) == 1)||(cur_digit(6) == 3)||(cur_digit(6) == 5)||(cur_digit(6) == 7)||(cur_digit(6) == 9)
                    set(circle(1:4),'FaceAlpha',0.15)
                else
                    set(circle(1:4),'FaceAlpha',1)
                end
        % Update figure
       drawnow
    end