# LGF SPAWN SELECTOR
Advanced Spawn Selector for Fivem Server
<table style="width:100%; text-align:center; border-collapse:separate; border-spacing:20px 10px;">
  <tr>
    <td style="text-align:center;">
      <a href="https://github.com/ENT510">
        <img src="https://github.com/Legacy-Framework/LGF-Spawn-Selector/assets/145626625/d55fd7ab-4d9b-4451-9989-82813d0167b3" alt="SPAWN SELECTOR UI" width="650" style="border-radius:50%; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);"/>
      </a>
      <br>
  </tr>
</table>

- [SHOWCASE](https://www.youtube.com/watch?v=T8Ze18w0ofk&feature=youtu.be)

- [DISCORD](https://discord.gg/wd5PszPA2p)
### Dependency
- Ox Lib
- Screenshot-Basic (Only if use Webhook)

### Framework
- ESX
- LGF
- QBOX (SOON)

## FEATURES

- **Full Customization**: Customize spawn points with icons, positions, images, and names.
- **Internal Notifications**: Notify users internally about spawn selections.
- **Image Preview**: Preview images associated with spawn points.
- **Responsive UI**: User interface adjusts seamlessly across devices.
- **Log Webhook**: Track player spawns in real time with screenshot (require screenshot-basic).
- **Last Coords**: Retrieve Last Coords.
- **SpawnData Position**
  - **Choose Icon**: Select icons for spawn points.
  - **Choose Position**: Define precise coordinates for each spawn point.
  - **Choose Image**: Attach images to enhance spawn point descriptions.
  - **Choose Name Point**: Assign names to easily identify spawn points.
  - **Choose Icon Color**: Customize icon colors to match your UI theme.
  - **Camera Options**
    - **Choose Height**: Adjust camera height for optimal viewing.
    - **Choose Rotation and Pitch**: Set camera angles for better orientation.

## Open Spawn Selector (Only Client)

### OPEN SPAWN SELECTOR VIA EVENT or EXPORT
  
```lua
TriggerEvent('LGF_SpawnSelector:OpenSpawnSelector')
```

### OPEN SPAWN SELECTOR BY EXPORT
  
```lua
exports.LGF_SpawnSelector:OpenSpawnSelector()
```

## Example Usage:
```lua
RegisterCommand('openspawnselector', function()
    DoScreenFadeOut(1000)
    TriggerEvent('LGF_SpawnSelector:OpenSpawnSelector')
    Wait(1500)
    DoScreenFadeIn(1000)
end)
```
