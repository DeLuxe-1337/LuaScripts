
--Credits to whom ever made this.

function Align(Part1, Part0, Position, Angle, name)
    local AlignPos = Instance.new("AlignPosition", Part1)
    AlignPos.Parent.CanCollide = false
    AlignPos.ApplyAtCenterOfMass = true
    AlignPos.MaxForce = 67752
    AlignPos.MaxVelocity = math.huge / 9e110
    AlignPos.ReactionForceEnabled = false
    AlignPos.Responsiveness = 200
    AlignPos.RigidityEnabled = false

    local AlignOrient = Instance.new("AlignOrientation", Part1)
    AlignOrient.MaxAngularVelocity = math.huge / 9e110
    AlignOrient.MaxTorque = 67752
    AlignOrient.PrimaryAxisOnly = false
    AlignOrient.ReactionTorqueEnabled = false
    AlignOrient.Responsiveness = 200
    AlignOrient.RigidityEnabled = false

    local AttachmentA = Instance.new("Attachment", Part1)

    local AttachmentB = Instance.new("Attachment", Part0)
    AttachmentB.Orientation = Angle
    AttachmentB.Position = Position
    AttachmentB.Name = name

    AlignPos.Attachment0 = AttachmentA
    AlignPos.Attachment1 = AttachmentB

    AlignOrient.Attachment0 = AttachmentA
    AlignOrient.Attachment1 = AttachmentB
end

local NetworkAccess =
    coroutine.create(
    function()
        settings().Physics.AllowSleep = false
        while true do
            game:GetService("RunService").RenderStepped:Wait()
            for _, Players in next, game:GetService("Players"):GetChildren() do
                if Players ~= game:GetService("Players").LocalPlayer then
                    Players.MaximumSimulationRadius = 0.1
                    Players.SimulationRadius = 0
                end
            end
            game:GetService("Players").LocalPlayer.MaximumSimulationRadius = math.pow(math.huge, math.huge)
            game:GetService("Players").LocalPlayer.SimulationRadius = math.huge * math.huge
        end
    end
)
coroutine.resume(NetworkAccess)
