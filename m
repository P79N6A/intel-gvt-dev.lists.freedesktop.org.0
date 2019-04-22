Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:ed4:0:0:0:0:0 with SMTP id 203csp2082078ywo;
        Mon, 22 Apr 2019 01:49:36 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz84QPG2S6JH4b5dG1BAeVl3hTLNweIhrH4E31OpuuTE2iVGyQcQlDR80RshTb7BQsEsh7T
X-Received: by 2002:a63:be02:: with SMTP id l2mr18071537pgf.48.1555922976755;
        Mon, 22 Apr 2019 01:49:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555922976; cv=none;
        d=google.com; s=arc-20160816;
        b=BtATxqujVb/DoHDyvBGzq/2E6TFHdIu2bZwPWPV2XWi8cEMrx7Jpb+ykHC0U//QMs6
         7TMZ2A0ol+SUqwV8Y1yRzixiHpVX8Vg6tKBtEJRslEk8IBjJ3CWiNU1HIifw1NurPDvP
         OAFYBzILUx49zEP5muwvrquqZQ9jOePAYWAvR4KFlsMb4vfFM2VwfiRqZRHk4dYkl8RV
         pTpVJEU8JDSFIcq8AT9Ch8wQD1ZKUVxdoSBryMrn+2G2IUHF8R+uU+ln8FhC7DHw9kws
         ALizrk1nLCzkEn2RU2NM0COa9lkJst4TB4Wfn3TQeOYRV8nMj5Fw6kghDxsECipD5++M
         hLUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:mime-version:references:message-id:subject:to:from:date
         :delivered-to;
        bh=txV/lsHFT1GBJ2iCqH+0/b+jmfMfpoB+CHkRE3owlWk=;
        b=wJB58buqhYrmjOekKdEyCKgFKpKMb71d0qFW9VH8wmb//zWoQpDn8jxvgL3AlovLeo
         ueWH3XzgAxAiIlJGAMt8ppQ+s5KAZhmeCfpS+0IBeXgNwucjiJwOTAYZjhc/mY2ruxzm
         +UtPYPj0M4VwEMPIN+MpKVv/TMwhosFhrs7bvaEEVGz6R9OR5Na184tw983g/O44HTXA
         3bxM9YcfnLd/16V4kawCGFC9TV+ItTLC3SrkrljSHDUEZsBAA+L4W/y2mmdIXoZl7tIr
         gn5RpwssKwjfVHDm1wvMHNuN6M29Qqf6NSaTRRQkXZ4mJ87DOHvqu6RfCnQc8DMQP608
         qpbQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id j12si12781703plk.144.2019.04.22.01.49.35
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Apr 2019 01:49:36 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C237F89119;
	Mon, 22 Apr 2019 08:49:35 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 142D889119
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 22 Apr 2019 08:49:34 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Apr 2019 01:49:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,381,1549958400"; 
 d="asc'?scan'208";a="144635093"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.13.116])
 by orsmga003.jf.intel.com with ESMTP; 22 Apr 2019 01:49:24 -0700
Date: Mon, 22 Apr 2019 16:37:39 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Yan Zhao <yan.y.zhao@intel.com>
Subject: Re: [PATCH 2/2] drm/i915/gvt: export mdev device version to sysfs
 for Intel vGPU
Message-ID: <20190422083739.GZ17995@zhen-hp.sh.intel.com>
References: <20190419083258.19580-1-yan.y.zhao@intel.com>
 <20190419083559.19725-1-yan.y.zhao@intel.com>
MIME-Version: 1.0
In-Reply-To: <20190419083559.19725-1-yan.y.zhao@intel.com>
User-Agent: Mutt/1.10.0 (2018-05-17)
X-BeenThere: intel-gvt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: "Intel GVT \(Graphics Virtualization\) development list"
 <intel-gvt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gvt-dev>, 
 <mailto:intel-gvt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gvt-dev>
List-Post: <mailto:intel-gvt-dev@lists.freedesktop.org>
List-Help: <mailto:intel-gvt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev>, 
 <mailto:intel-gvt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: Zhenyu Wang <zhenyuw@linux.intel.com>
Cc: cjia@nvidia.com, kvm@vger.kernel.org, aik@ozlabs.ru,
 Zhengxiao.zx@alibaba-inc.com, shuangtai.tst@alibaba-inc.com,
 qemu-devel@nongnu.org, kwankhede@nvidia.com, eauger@redhat.com,
 yi.l.liu@intel.com, eskultet@redhat.com, ziye.yang@intel.com,
 mlevitsk@redhat.com, pasic@linux.ibm.com, libvir-list@redhat.com,
 arei.gonglei@huawei.com, felipe@nutanix.com, Ken.Xue@amd.com,
 kevin.tian@intel.com, dgilbert@redhat.com, zhenyuw@linux.intel.com,
 alex.williamson@redhat.com, intel-gvt-dev@lists.freedesktop.org,
 changpeng.liu@intel.com, cohuck@redhat.com, linux-kernel@vger.kernel.org,
 zhi.a.wang@intel.com, jonathan.davies@nutanix.com, shaopeng.he@intel.com
Content-Type: multipart/mixed; boundary="===============1296762242=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============1296762242==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="HzTfXcfu7EFt5lUB"
Content-Disposition: inline


--HzTfXcfu7EFt5lUB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2019.04.19 04:35:59 -0400, Yan Zhao wrote:
> This feature implements the version attribute for Intel's vGPU mdev
> devices.
>=20
> version attribute is rw. It is queried by userspace software like libvirt
> to check whether two vGPUs are compatible for live migration.
>=20
> It consists of two parts: common part and vendor proprietary part.
> common part: 32 bit. lower 16 bits is vendor id and higher 16 bits
>              identifies device type. e.g., for pci device, it is
>              "pci vendor id" | (VFIO_DEVICE_FLAGS_PCI << 16).
> vendor proprietary part: this part is varied in length. vendor driver can
>              specify any string to identify a device.
>=20
> For Intel vGPU of gen8 and gen9, the vendor proprietary part currently
> consists of 2 fields: "device id" + "mdev type".
>=20
> Reading from a vGPU's version attribute, a string is returned in below
> format: 00028086-<device id>-<mdev type>. e.g.
> 00028086-193b-i915-GVTg_V5_2.
>=20
> Writing a string to a vGPU's version attribute will trigger GVT to check
> whether a vGPU identified by the written string is compatible with
> current vGPU owning this version attribute. errno is returned if the two
> vGPUs are incompatible. The length of written string is returned in
> compatible case.
>=20
> For other platforms, and for GVT not supporting vGPU live migration
> feature, errnos are returned when read/write of mdev devices' version
> attributes.
>=20
> For old GVT versions where no version attributes exposed in sysfs, it is
> regarded as not supporting vGPU live migration.
>=20
> For future platforms, besides the current 2 fields in vendor proprietary
> part, more fields may be added to identify Intel vGPU well for live
> migration purpose.
>=20
> Cc: Alex Williamson <alex.williamson@redhat.com>
> Cc: Erik Skultety <eskultet@redhat.com>
> Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> Cc: Cornelia Huck <cohuck@redhat.com>
> Cc: "Tian, Kevin" <kevin.tian@intel.com>
> Cc: Zhenyu Wang <zhenyuw@linux.intel.com>
> Cc: "Wang, Zhi A" <zhi.a.wang@intel.com>
> c: Neo Jia <cjia@nvidia.com>
> Cc: Kirti Wankhede <kwankhede@nvidia.com>
>=20
> Signed-off-by: Yan Zhao <yan.y.zhao@intel.com>
> ---
>  drivers/gpu/drm/i915/gvt/Makefile         |  2 +-
>  drivers/gpu/drm/i915/gvt/device_version.c | 94 +++++++++++++++++++++++
>  drivers/gpu/drm/i915/gvt/gvt.c            | 55 +++++++++++++
>  drivers/gpu/drm/i915/gvt/gvt.h            |  6 ++
>  4 files changed, 156 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpu/drm/i915/gvt/device_version.c
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/Makefile b/drivers/gpu/drm/i915/gvt=
/Makefile
> index 271fb46d4dd0..54e209a23899 100644
> --- a/drivers/gpu/drm/i915/gvt/Makefile
> +++ b/drivers/gpu/drm/i915/gvt/Makefile
> @@ -3,7 +3,7 @@ GVT_DIR :=3D gvt
>  GVT_SOURCE :=3D gvt.o aperture_gm.o handlers.o vgpu.o trace_points.o fir=
mware.o \
>  	interrupt.o gtt.o cfg_space.o opregion.o mmio.o display.o edid.o \
>  	execlist.o scheduler.o sched_policy.o mmio_context.o cmd_parser.o debug=
fs.o \
> -	fb_decoder.o dmabuf.o page_track.o
> +	fb_decoder.o dmabuf.o page_track.o device_version.o
> =20
>  ccflags-y				+=3D -I$(src) -I$(src)/$(GVT_DIR)
>  i915-y					+=3D $(addprefix $(GVT_DIR)/, $(GVT_SOURCE))
> diff --git a/drivers/gpu/drm/i915/gvt/device_version.c b/drivers/gpu/drm/=
i915/gvt/device_version.c
> new file mode 100644
> index 000000000000..c64010d2bc54
> --- /dev/null
> +++ b/drivers/gpu/drm/i915/gvt/device_version.c
> @@ -0,0 +1,94 @@
> +/*
> + * Copyright(c) 2011-2017 Intel Corporation. All rights reserved.
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining=
 a
> + * copy of this software and associated documentation files (the "Softwa=
re"),
> + * to deal in the Software without restriction, including without limita=
tion
> + * the rights to use, copy, modify, merge, publish, distribute, sublicen=
se,
> + * and/or sell copies of the Software, and to permit persons to whom the
> + * Software is furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice (including the =
next
> + * paragraph) shall be included in all copies or substantial portions of=
 the
> + * Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRE=
SS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILI=
TY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SH=
ALL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR =
OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISI=
NG FROM,
> + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALING=
S IN THE
> + * SOFTWARE.
> + */
> +#include <linux/vfio.h>
> +#include "i915_drv.h"
> +
> +#define GVT_VFIO_DEVICE_VENDOR_ID ((0x8086) |	\
> +		((VFIO_DEVICE_FLAGS_PCI & 0xff) << 16))
> +
> +#define GVT_DEVICE_VERSION_COMMON_LEN 0x8
> +#define GVT_DEVICE_VERSION_DEVICE_ID_LEN 0x4
> +
> +static bool is_compatible(const char *self, const char *remote)
> +{
> +	if (strlen(remote) !=3D strlen(self))
> +		return false;
> +
> +	return (strncmp(self, remote, strlen(self))) ? false : true;
> +}
> +
> +ssize_t intel_gvt_get_vfio_device_version_len(struct drm_i915_private *d=
ev_priv)
> +{
> +	if (!IS_GEN(dev_priv, 8) && !IS_GEN(dev_priv, 9))
> +		return -ENODEV;
> +
> +	return PAGE_SIZE;
> +}
> +
> +ssize_t intel_gvt_get_vfio_device_version(struct drm_i915_private *dev_p=
riv,
> +		char *buf, const char *mdev_type)
> +{
> +	int cnt =3D 0, ret =3D 0;
> +	const char *str =3D NULL;
> +
> +	/* currently only gen8 & gen9 are supported */
> +	if (!IS_GEN(dev_priv, 8) && !IS_GEN(dev_priv, 9))
> +		return -ENODEV;
> +
> +	/* first 32 bit common part specifying vendor id and it's a pci
> +	 * device
> +	 */
> +	cnt =3D snprintf(buf, GVT_DEVICE_VERSION_COMMON_LEN + 1,
> +			"%08x", GVT_VFIO_DEVICE_VENDOR_ID);
> +	buf +=3D cnt;
> +	ret +=3D cnt;
> +
> +	/* vendor proprietary part: device id + mdev type */
> +	/* device id */
> +	cnt =3D snprintf(buf, GVT_DEVICE_VERSION_DEVICE_ID_LEN + 2,
> +			"-%04x", INTEL_DEVID(dev_priv));
> +	buf +=3D cnt;
> +	ret +=3D cnt;
> +
> +	/* mdev type */
> +	str =3D mdev_type;
> +	cnt =3D snprintf(buf, strlen(str) + 3, "-%s\n", mdev_type);
> +	buf +=3D cnt;
> +	ret +=3D cnt;
> +
> +	return ret;
> +}
> +
> +ssize_t intel_gvt_check_vfio_device_version(struct drm_i915_private *dev=
_priv,
> +		const char *self, const char *remote)
> +{
> +
> +	/* currently only gen8 & gen9 are supported */
> +	if (!IS_GEN(dev_priv, 8) && !IS_GEN(dev_priv, 9))
> +		return -ENODEV;
> +
> +	if (!is_compatible(self, remote))
> +		return -EINVAL;
> +
> +	return 0;
> +}
> diff --git a/drivers/gpu/drm/i915/gvt/gvt.c b/drivers/gpu/drm/i915/gvt/gv=
t.c
> index 43f4242062dd..e720465b93d8 100644
> --- a/drivers/gpu/drm/i915/gvt/gvt.c
> +++ b/drivers/gpu/drm/i915/gvt/gvt.c
> @@ -105,14 +105,69 @@ static ssize_t description_show(struct kobject *kob=
j, struct device *dev,
>  		       type->weight);
>  }
> =20
> +static ssize_t version_show(struct kobject *kobj, struct device *dev,
> +		char *buf)
> +{
> +#ifdef GVT_MIGRATION_VERSION
> +	struct drm_i915_private *i915 =3D kdev_to_i915(dev);
> +	const char *mdev_type =3D kobject_name(kobj);
> +
> +	return intel_gvt_get_vfio_device_version(i915, buf, mdev_type);
> +#else
> +	/* do not support live migration */
> +	return -EINVAL;
> +#endif
> +}
> +
> +static ssize_t version_store(struct kobject *kobj, struct device *dev,
> +		const char *buf, size_t count)
> +{
> +#ifdef GVT_MIGRATION_VERSION
> +	char *remote =3D NULL, *self =3D NULL;
> +	int len, ret =3D 0;
> +	struct drm_i915_private *i915 =3D kdev_to_i915(dev);
> +	const char *mdev_type =3D kobject_name(kobj);
> +
> +	len =3D intel_gvt_get_vfio_device_version_len(i915);
> +	if (len < 0)
> +		return len;
> +
> +	self =3D kmalloc(len, GFP_KERNEL);
> +	if (!self)
> +		return -ENOMEM;
> +
> +	ret =3D intel_gvt_get_vfio_device_version(i915, self, mdev_type);
> +	if (ret < 0)
> +		goto out;
> +

device version string should be allocated and specified during device insta=
nce
setup instead of version attribute r/w time.

> +	remote =3D kstrndup(buf, count, GFP_KERNEL);
> +	if (!remote) {
> +		ret =3D -ENOMEM;
> +		goto out;
> +	}
> +
> +	ret =3D intel_gvt_check_vfio_device_version(i915, self, remote);
> +
> +out:
> +	kfree(self);
> +	kfree(remote);
> +	return (ret < 0 ? ret : count);
> +#else
> +	/* do not support live migration */
> +	return -EINVAL;
> +#endif
> +}
> +
>  static MDEV_TYPE_ATTR_RO(available_instances);
>  static MDEV_TYPE_ATTR_RO(device_api);
>  static MDEV_TYPE_ATTR_RO(description);
> +static MDEV_TYPE_ATTR_RW(version);
> =20
>  static struct attribute *gvt_type_attrs[] =3D {
>  	&mdev_type_attr_available_instances.attr,
>  	&mdev_type_attr_device_api.attr,
>  	&mdev_type_attr_description.attr,
> +	&mdev_type_attr_version.attr,
>  	NULL,
>  };
> =20
> diff --git a/drivers/gpu/drm/i915/gvt/gvt.h b/drivers/gpu/drm/i915/gvt/gv=
t.h
> index f5a328b5290a..4062f6b26acf 100644
> --- a/drivers/gpu/drm/i915/gvt/gvt.h
> +++ b/drivers/gpu/drm/i915/gvt/gvt.h
> @@ -687,6 +687,12 @@ void intel_gvt_debugfs_remove_vgpu(struct intel_vgpu=
 *vgpu);
>  int intel_gvt_debugfs_init(struct intel_gvt *gvt);
>  void intel_gvt_debugfs_clean(struct intel_gvt *gvt);
> =20
> +ssize_t intel_gvt_get_vfio_device_version(struct drm_i915_private *i915,
> +		char *buf, const char *mdev_type);
> +ssize_t intel_gvt_check_vfio_device_version(struct drm_i915_private *dev=
_priv,
> +		const char *self, const char *remote);
> +ssize_t
> +intel_gvt_get_vfio_device_version_len(struct drm_i915_private *dev_priv);
> =20
>  #include "trace.h"
>  #include "mpt.h"
> --=20
> 2.17.1
>=20
> _______________________________________________
> intel-gvt-dev mailing list
> intel-gvt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--HzTfXcfu7EFt5lUB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXL19UwAKCRCxBBozTXgY
J+toAJ974MbVdoDE7bLmBvDpVxOCFXwyFQCgmFWoFkEzSEB8o9dnMDFuXRTx22U=
=TtW/
-----END PGP SIGNATURE-----

--HzTfXcfu7EFt5lUB--

--===============1296762242==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2

--===============1296762242==--
