#![cfg(feature = "vulkan")]

//! Aliases for various Vulkan types that libretro_vulkan.h uses.
//! The original types are all prefixed with "Vk",
//! but their Ash bindings drop this prefix in favor of the "vk" module
//! (e.g. "VkDevice" becomes "vk::Device").

use ash::vk::*;

pub type PFN_vkGetInstanceProcAddr = PFN_vkGetInstanceProcAddr;
pub type PFN_vkGetDeviceProcAddr = PFN_vkGetDeviceProcAddr;
pub type VkApplicationInfo<'a> = ApplicationInfo<'a>;
pub type VkInstanceCreateInfo<'a> = InstanceCreateInfo<'a>;
pub type VkDeviceCreateInfo<'a> = DeviceCreateInfo<'a>;
pub type VkImageViewCreateInfo<'a> = ImageViewCreateInfo<'a>;

pub type VkDevice = Device;
pub type VkInstance = Instance;

pub type VkCommandBuffer = CommandBuffer;
pub type VkImageLayout = ImageLayout;
pub type VkImageView = ImageView;
pub type VkPhysicalDevice = PhysicalDevice;
pub type VkPhysicalDeviceFeatures = PhysicalDeviceFeatures;
pub type VkQueue = Queue;
pub type VkSemaphore = Semaphore;
pub type VkSurfaceKHR = SurfaceKHR;
