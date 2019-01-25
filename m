Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a0d:d7d3:0:0:0:0:0 with SMTP id z202csp2676413ywd;
        Thu, 24 Jan 2019 21:24:43 -0800 (PST)
X-Google-Smtp-Source: ALg8bN50/UQSDcWp0mh4JEktMWUkI966CHwLy+JAPhgmQunfowQCX4vY++WW6yv0Glh2YlfPc7pK
X-Received: by 2002:aa7:85d7:: with SMTP id z23mr9840102pfn.205.1548393883294;
        Thu, 24 Jan 2019 21:24:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548393883; cv=none;
        d=google.com; s=arc-20160816;
        b=ymmEpI1lrkfm72AhyLIunlFx4NgC7/bqXy88omPvGBB616q+ZKDImJUJvGQzeHNu4X
         J9+V+37zT+oZrpOaGCR0XM1o3sGp02tbjU0NCV9VmKjUbQtjvc3PDSYF5N6hZOHeNeol
         EaVV+yTDmqbgbSXGaoSF0241oucmAosUpgHF9Z5GIcDXWf0cRpK4ODkQBkKBHCKlSYOo
         b9y3Samyhk6/WouUSjKWcCSID0lU5pfiK8JPkZJyFNx+86WdKKbNQYLxFcK3QGALGNZG
         LP3++A8hF0f9nbsBv/iyWO16k1iKsPe3PzsGYUTBA28oZl2lz2/QaGPTUzgvv/iEAzBo
         TwCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:mime-version:references:message-id:subject:to:from:date
         :delivered-to;
        bh=OnU93wBLkGj1kvRrDby70Vzd1ra1hvqAB9G4hAzVpQw=;
        b=FtAnsvy4ehmG6WLphkaDKuL6VyKoQ0Z2IBQyK2aNWXJsu90qJ2JrfYqjuGJrAIxgP2
         qQgq7DimGTeJibryYtxytbpUlbgXitKBq8Ext3svxtNF3NBhOTlS9ecl7804ILGeDKJ1
         q3ST+A94mD1etCF2CAhjuZJmBvVxiJN7duymOLrwPpL035/oF0vz1s40GsfOo1xeMreU
         dWX5x6+ahd4kZT6NSBuyBvVbY3ermcCaElbWNCs/cT/O1TwYdILq0Kb6AhsJZJsvvzkp
         ve28bakRmLESWj5DI1vON5d2SYouECnwzQbVCKqRh+Jn9C2jpOkxrB/j8viVB/nQscwm
         JOwA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id w2si22145314pgp.546.2019.01.24.21.24.42
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 24 Jan 2019 21:24:43 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 514146E365;
	Fri, 25 Jan 2019 05:24:42 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98C726E365
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 25 Jan 2019 05:24:40 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 24 Jan 2019 21:24:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,519,1539673200"; 
 d="asc'?scan'208";a="269771627"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.13.116])
 by orsmga004.jf.intel.com with ESMTP; 24 Jan 2019 21:24:38 -0800
Date: Fri, 25 Jan 2019 13:16:00 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: hang.yuan@linux.intel.com
Subject: Re: [PATCH v2 3/3] drm/i915/gvt: add VFIO EDID region
Message-ID: <20190125051600.GT7203@zhen-hp.sh.intel.com>
References: <1548308797-3109-1-git-send-email-hang.yuan@linux.intel.com>
 <1548308797-3109-4-git-send-email-hang.yuan@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <1548308797-3109-4-git-send-email-hang.yuan@linux.intel.com>
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
Cc: intel-gvt-dev@lists.freedesktop.org, kraxel@redhat.com
Content-Type: multipart/mixed; boundary="===============1812169552=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============1812169552==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="4e5ZDkbgLEOfWmLx"
Content-Disposition: inline


--4e5ZDkbgLEOfWmLx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2019.01.24 13:46:37 +0800, hang.yuan@linux.intel.com wrote:
> From: Hang Yuan <hang.yuan@linux.intel.com>
>=20
> Implement VFIO EDID region for vgpu. Support EDID blob update and notify
> guest on link state change via hotplug event.
>=20
> v2: add EDID sanity check and size update <zhenyu>
>=20
> Tested-by: Gerd Hoffmann <kraxel@redhat.com>
> Signed-off-by: Hang Yuan <hang.yuan@linux.intel.com>
> ---

Looks fine to me, some little comments below.

>  drivers/gpu/drm/i915/gvt/gvt.h       |   7 ++
>  drivers/gpu/drm/i915/gvt/hypercall.h |   1 +
>  drivers/gpu/drm/i915/gvt/kvmgt.c     | 138 +++++++++++++++++++++++++++++=
++++++
>  drivers/gpu/drm/i915/gvt/mpt.h       |  17 +++++
>  drivers/gpu/drm/i915/gvt/vgpu.c      |   6 ++
>  5 files changed, 169 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/gvt.h b/drivers/gpu/drm/i915/gvt/gv=
t.h
> index 8bce09d..5793619 100644
> --- a/drivers/gpu/drm/i915/gvt/gvt.h
> +++ b/drivers/gpu/drm/i915/gvt/gvt.h
> @@ -127,6 +127,13 @@ struct intel_vgpu_opregion {
> =20
>  #define vgpu_opregion(vgpu) (&(vgpu->opregion))
> =20
> +#if IS_ENABLED(CONFIG_DRM_I915_GVT_KVMGT)
> +	struct intel_vgpu_edid_region {
> +		struct vfio_region_gfx_edid vfio_edid_regs;
> +		void *edid_blob;
> +	};
> +#endif

I think better just move this in kvmgt.c itself which is only used there.

> +
>  struct intel_vgpu_display {
>  	struct intel_vgpu_i2c_edid i2c_edid;
>  	struct intel_vgpu_port ports[I915_MAX_PORTS];
> diff --git a/drivers/gpu/drm/i915/gvt/hypercall.h b/drivers/gpu/drm/i915/=
gvt/hypercall.h
> index 831ab34..4862fb1 100644
> --- a/drivers/gpu/drm/i915/gvt/hypercall.h
> +++ b/drivers/gpu/drm/i915/gvt/hypercall.h
> @@ -67,6 +67,7 @@ struct intel_gvt_mpt {
>  	int (*set_trap_area)(unsigned long handle, u64 start, u64 end,
>  			     bool map);
>  	int (*set_opregion)(void *vgpu);
> +	int (*set_edid)(void *vgpu, int port_num);
>  	int (*get_vfio_device)(void *vgpu);
>  	void (*put_vfio_device)(void *vgpu);
>  	bool (*is_valid_gfn)(unsigned long handle, unsigned long gfn);
> diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/=
kvmgt.c
> index 5bec0b5..ae88f17 100644
> --- a/drivers/gpu/drm/i915/gvt/kvmgt.c
> +++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
> @@ -57,6 +57,8 @@ static const struct intel_gvt_ops *intel_gvt_ops;
>  #define VFIO_PCI_INDEX_TO_OFFSET(index) ((u64)(index) << VFIO_PCI_OFFSET=
_SHIFT)
>  #define VFIO_PCI_OFFSET_MASK    (((u64)(1) << VFIO_PCI_OFFSET_SHIFT) - 1)
> =20
> +#define EDID_BLOB_OFFSET (PAGE_SIZE/2)
> +
>  #define OPREGION_SIGNATURE "IntelGraphicsMem"
> =20
>  struct vfio_region;
> @@ -427,6 +429,111 @@ static const struct intel_vgpu_regops intel_vgpu_re=
gops_opregion =3D {
>  	.release =3D intel_vgpu_reg_release_opregion,
>  };
> =20
> +static int handle_edid_regs(struct intel_vgpu *vgpu,
> +			struct intel_vgpu_edid_region *region, char *buf,
> +			size_t count, u16 offset, bool is_write)
> +{
> +	struct vfio_region_gfx_edid *regs =3D &region->vfio_edid_regs;
> +	unsigned int data;
> +
> +	if (offset + count > sizeof(*regs))
> +		return -EINVAL;
> +
> +	if (count !=3D 4)
> +		return -EINVAL;
> +
> +	if (is_write) {
> +		data =3D *((unsigned int *)buf);
> +		switch (offset) {
> +		case offsetof(struct vfio_region_gfx_edid, link_state):
> +			if (data =3D=3D VFIO_DEVICE_GFX_LINK_STATE_UP) {
> +				if (!drm_edid_block_valid(
> +					(u8 *)region->edid_blob,
> +					0,
> +					true,
> +					NULL)) {
> +					gvt_vgpu_err("invalid EDID blob\n");
> +					return -EINVAL;
> +				}

Might just write if (data =3D=3D ...STATE_UP && !drm_edid_block_valid(...))=
 return -EINVAL;

> +				intel_gvt_ops->emulate_hotplug(vgpu, true);
> +			} else if (data =3D=3D VFIO_DEVICE_GFX_LINK_STATE_DOWN)
> +				intel_gvt_ops->emulate_hotplug(vgpu, false);
> +			else {
> +				gvt_vgpu_err("invalid EDID link state %d\n",
> +					regs->link_state);
> +				return -EINVAL;
> +			}
> +			regs->link_state =3D data;
> +			break;
> +		case offsetof(struct vfio_region_gfx_edid, edid_size):
> +			if (data > regs->edid_max_size) {
> +				gvt_vgpu_err("EDID size is bigger than %d!\n",
> +					regs->edid_max_size);
> +				return -EINVAL;
> +			}
> +			regs->edid_size =3D data;
> +			break;
> +		default:
> +			/* read-only regs */
> +			gvt_vgpu_err("write read-only EDID region at offset %d\n",
> +				offset);
> +			return -EPERM;
> +		}
> +	} else {
> +		memcpy(buf, (char *)regs + offset, count);
> +	}
> +
> +	return count;
> +}
> +
> +static int handle_edid_blob(struct intel_vgpu_edid_region *region, char =
*buf,
> +			size_t count, u16 offset, bool is_write)
> +{
> +	if (offset + count > region->vfio_edid_regs.edid_size)
> +		return -EINVAL;
> +
> +	if (is_write)
> +		memcpy(region->edid_blob + offset, buf, count);
> +	else
> +		memcpy(buf, region->edid_blob + offset, count);
> +
> +	return count;
> +}
> +
> +static size_t intel_vgpu_reg_rw_edid(struct intel_vgpu *vgpu, char *buf,
> +		size_t count, loff_t *ppos, bool iswrite)
> +{
> +	int ret;
> +	unsigned int i =3D VFIO_PCI_OFFSET_TO_INDEX(*ppos) -
> +			VFIO_PCI_NUM_REGIONS;
> +	struct intel_vgpu_edid_region *region =3D
> +		(struct intel_vgpu_edid_region *)vgpu->vdev.region[i].data;
> +	loff_t pos =3D *ppos & VFIO_PCI_OFFSET_MASK;
> +
> +	if (pos < region->vfio_edid_regs.edid_offset) {
> +		ret =3D handle_edid_regs(vgpu, region, buf, count, pos, iswrite);
> +	} else {
> +		pos -=3D EDID_BLOB_OFFSET;
> +		ret =3D handle_edid_blob(region, buf, count, pos, iswrite);
> +	}
> +
> +	if (ret < 0)
> +		gvt_vgpu_err("failed to access EDID region\n");
> +
> +	return ret;
> +}
> +
> +static void intel_vgpu_reg_release_edid(struct intel_vgpu *vgpu,
> +					struct vfio_region *region)
> +{
> +	kfree(region->data);
> +}
> +
> +static const struct intel_vgpu_regops intel_vgpu_regops_edid =3D {
> +	.rw =3D intel_vgpu_reg_rw_edid,
> +	.release =3D intel_vgpu_reg_release_edid,
> +};
> +
>  static int intel_vgpu_register_reg(struct intel_vgpu *vgpu,
>  		unsigned int type, unsigned int subtype,
>  		const struct intel_vgpu_regops *ops,
> @@ -493,6 +600,36 @@ static int kvmgt_set_opregion(void *p_vgpu)
>  	return ret;
>  }
> =20
> +static int kvmgt_set_edid(void *p_vgpu, int port_num)
> +{
> +	struct intel_vgpu *vgpu =3D (struct intel_vgpu *)p_vgpu;
> +	struct intel_vgpu_port *port =3D intel_vgpu_port(vgpu, port_num);
> +	struct intel_vgpu_edid_region *base;
> +	int ret;
> +
> +	base =3D kzalloc(sizeof(*base), GFP_KERNEL);
> +	if (!base)
> +		return -ENOMEM;
> +
> +	/* TODO: Add multi-port and EDID extension block support */
> +	base->vfio_edid_regs.edid_offset =3D EDID_BLOB_OFFSET;
> +	base->vfio_edid_regs.edid_max_size =3D EDID_SIZE;
> +	base->vfio_edid_regs.edid_size =3D EDID_SIZE;
> +	base->vfio_edid_regs.max_xres =3D vgpu_edid_xres(port->id);
> +	base->vfio_edid_regs.max_yres =3D vgpu_edid_yres(port->id);
> +	base->edid_blob =3D port->edid->edid_block;
> +
> +	ret =3D intel_vgpu_register_reg(vgpu,
> +			VFIO_REGION_TYPE_GFX,
> +			VFIO_REGION_SUBTYPE_GFX_EDID,
> +			&intel_vgpu_regops_edid, EDID_SIZE,
> +			VFIO_REGION_INFO_FLAG_READ |
> +			VFIO_REGION_INFO_FLAG_WRITE |
> +			VFIO_REGION_INFO_FLAG_CAPS, base);
> +
> +	return ret;
> +}
> +
>  static void kvmgt_put_vfio_device(void *vgpu)
>  {
>  	if (WARN_ON(!((struct intel_vgpu *)vgpu)->vdev.vfio_device))
> @@ -1896,6 +2033,7 @@ static struct intel_gvt_mpt kvmgt_mpt =3D {
>  	.dma_map_guest_page =3D kvmgt_dma_map_guest_page,
>  	.dma_unmap_guest_page =3D kvmgt_dma_unmap_guest_page,
>  	.set_opregion =3D kvmgt_set_opregion,
> +	.set_edid =3D kvmgt_set_edid,
>  	.get_vfio_device =3D kvmgt_get_vfio_device,
>  	.put_vfio_device =3D kvmgt_put_vfio_device,
>  	.is_valid_gfn =3D kvmgt_is_valid_gfn,
> diff --git a/drivers/gpu/drm/i915/gvt/mpt.h b/drivers/gpu/drm/i915/gvt/mp=
t.h
> index 5b5995a..0f94401 100644
> --- a/drivers/gpu/drm/i915/gvt/mpt.h
> +++ b/drivers/gpu/drm/i915/gvt/mpt.h
> @@ -314,6 +314,23 @@ static inline int intel_gvt_hypervisor_set_opregion(=
struct intel_vgpu *vgpu)
>  }
> =20
>  /**
> + * intel_gvt_hypervisor_set_edid - Set EDID region for guest
> + * @vgpu: a vGPU
> + * @port_num: display port number
> + *
> + * Returns:
> + * Zero on success, negative error code if failed.
> + */
> +static inline int intel_gvt_hypervisor_set_edid(struct intel_vgpu *vgpu,
> +						int port_num)
> +{
> +	if (!intel_gvt_host.mpt->set_edid)
> +		return 0;
> +
> +	return intel_gvt_host.mpt->set_edid(vgpu, port_num);
> +}
> +
> +/**
>   * intel_gvt_hypervisor_get_vfio_device - increase vfio device ref count
>   * @vgpu: a vGPU
>   *
> diff --git a/drivers/gpu/drm/i915/gvt/vgpu.c b/drivers/gpu/drm/i915/gvt/v=
gpu.c
> index e1c860f8..720e2b1 100644
> --- a/drivers/gpu/drm/i915/gvt/vgpu.c
> +++ b/drivers/gpu/drm/i915/gvt/vgpu.c
> @@ -428,6 +428,12 @@ static struct intel_vgpu *__intel_gvt_create_vgpu(st=
ruct intel_gvt *gvt,
>  	if (ret)
>  		goto out_clean_sched_policy;
> =20
> +	/*TODO: add more platforms support */
> +	if (IS_SKYLAKE(gvt->dev_priv) || IS_KABYLAKE(gvt->dev_priv))
> +		ret =3D intel_gvt_hypervisor_set_edid(vgpu, PORT_D);
> +	if (ret)
> +		goto out_clean_sched_policy;
> +
>  	return vgpu;
> =20
>  out_clean_sched_policy:
> --=20
> 2.7.4
>=20
> _______________________________________________
> intel-gvt-dev mailing list
> intel-gvt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--4e5ZDkbgLEOfWmLx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXEqbkAAKCRCxBBozTXgY
J/81AJ9ynh79E4LDmiOu346yZ37k9NbDqgCePtqVQ+ULrcbUuUo0ES/f2mK3Xmg=
=i63/
-----END PGP SIGNATURE-----

--4e5ZDkbgLEOfWmLx--

--===============1812169552==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2
Cg==

--===============1812169552==--
