// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library EpochLib {
    uint256 constant SECONDS_PER_SLOT = 60;
    uint256 constant SLOTS_PER_EPOCH =
        60 /* minutes*/ * 24 /* hours*/ /* Epoch ~1 day */;

    /**
     * @notice Converts a slot number to an epoch number.
     * @param slot The slot number to convert.
     * @return The corresponding epoch number.
     */
    function slotToEpoch(uint256 slot) internal pure returns (uint256) {
        return slot / SLOTS_PER_EPOCH;
    }

    /**
     * @notice Gets the starting slot number of a given epoch.
     * @param epoch The epoch number.
     * @return The starting slot number of the epoch.
     */
    function epochStartSlot(uint256 epoch) internal pure returns (uint256) {
        return epoch * SLOTS_PER_EPOCH;
    }

    /**
     * @notice Gets the ending slot number of a given epoch.
     * @param epoch The epoch number.
     * @return The ending slot number of the epoch.
     */
    function epochEndSlot(uint256 epoch) internal pure returns (uint256) {
        return (epoch + 1) * SLOTS_PER_EPOCH - 1;
    }

    /**
     * @notice Converts a slot number to a timestamp.
     * @param slot The slot number to convert.
     * @param genesisTime The genesis time of the network.
     * @return The corresponding timestamp.
     */
    function slotToTime(
        uint256 slot,
        uint256 genesisTime
    ) internal pure returns (uint256) {
        return genesisTime + slot * SECONDS_PER_SLOT;
    }

    /**
     * @notice Gets the starting timestamp of a given epoch.
     * @param epoch The epoch number.
     * @param genesisTime The genesis time of the network.
     * @return The starting timestamp of the epoch.
     */
    function epochStartTime(
        uint256 epoch,
        uint256 genesisTime
    ) internal pure returns (uint256) {
        uint256 startSlot = epochStartSlot(epoch);
        return slotToTime(startSlot, genesisTime);
    }

    /**
     * @notice Gets the ending timestamp of a given epoch.
     * @param epoch The epoch number.
     * @param genesisTime The genesis time of the network.
     * @return The ending timestamp of the epoch.
     */
    function epochEndTime(
        uint256 epoch,
        uint256 genesisTime
    ) internal pure returns (uint256) {
        uint256 endSlot = epochEndSlot(epoch);
        return slotToTime(endSlot, genesisTime);
    }
}
