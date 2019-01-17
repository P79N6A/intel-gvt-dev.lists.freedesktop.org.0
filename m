Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a0d:d7d3:0:0:0:0:0 with SMTP id z202csp1349809ywd;
        Wed, 16 Jan 2019 21:09:07 -0800 (PST)
X-Google-Smtp-Source: ALg8bN7hEs8dFB+6yBLgGVKzRsDZ9XknRuDOo37SdC0LDuUqaneGcVrMyX2MMXZiCko6H8EQI5BV
X-Received: by 2002:a62:4bcf:: with SMTP id d76mr14037764pfj.170.1547701746938;
        Wed, 16 Jan 2019 21:09:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1547701746; cv=none;
        d=google.com; s=arc-20160816;
        b=GD3vS8bYRJPSTXKpWzS16NHvTF0WdudRfRuWkmKwbtgILaqhMdvQbDdx8rJNICdPTg
         JaFPl1YMynqCweOO7fhFtmFfkeeve6Gt9Zi3u6ZbWbY2zEhkI5CZJBqcPONIh4rIjfo0
         ybD0InglgkrB0mmJxfHm+2Nip57UI+ztqFBvyIcPjdRc82aCKXSmsnTOjWe2tdf0dIJV
         yjR5utH7g2zP5UJgBrvcyrob66Mv49QtkNaoNHXJ5o3ckz9CMzIFHF1qPHxlPk2Gpjr/
         mVl4WgUTqGDh69uSL/2aVXlq7s5sYC0et4B74ec7rFIf6G5685e+mVHm4LIKCr1GK9WJ
         aTfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:mime-version:references:message-id:subject:to:from:date
         :delivered-to;
        bh=T+t0YgBEHby7IvSVT9OrwGqcoPssG+o4YO+EHIlwU64=;
        b=0+lj7QQcnJ/1gU2DWacRZxP+8wclLenRvNYCZ8LMijUiAoO96aO8XT8x4jzTa8S3zQ
         vuiBVRA4KhtoixrEHpquNrINluAy7UHk/9jY1+yigudSSFbHN+Gl0IfA3KRDbsSClS5S
         RaeVwIaLZDp5uhYtZZ3iH0ovgwTF7hSRAtCZ7WRriLd1KjSZjo/1XFJgp+hTCYfDCm+K
         /fGI4yF1S8DdfmmHYA5UycCwAovpPaEudsLlMLlRuB6W5pdBl9XdMHex4J0uIl3W2lps
         0S23h9SjcyIZu0uN9pJMOT6rmNeAnUcGEjvIZY4EByLRAulsIfLQFzE6XWp59Za/8FQu
         53Hg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id z128si612688pgb.372.2019.01.16.21.09.06
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 16 Jan 2019 21:09:06 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF4826F2B8;
	Thu, 17 Jan 2019 05:09:05 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C93B6F2B8
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 17 Jan 2019 05:09:04 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 16 Jan 2019 21:09:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,488,1539673200"; 
 d="asc'?scan'208";a="108891418"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.13.8])
 by orsmga006.jf.intel.com with ESMTP; 16 Jan 2019 21:09:02 -0800
Date: Thu, 17 Jan 2019 12:57:34 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: hang.yuan@linux.intel.com
Subject: Re: [PATCH v2 3/3] drm/i915/gvt: add VFIO EDID region
Message-ID: <20190117045734.GD18272@zhen-hp.sh.intel.com>
References: <1547639067-5181-1-git-send-email-hang.yuan@linux.intel.com>
 <1547639067-5181-4-git-send-email-hang.yuan@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <1547639067-5181-4-git-send-email-hang.yuan@linux.intel.com>
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
Content-Type: multipart/mixed; boundary="===============1803193660=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============1803193660==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="vGgW1X5XWziG23Ko"
Content-Disposition: inline


--vGgW1X5XWziG23Ko
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2019.01.16 19:44:27 +0800, hang.yuan@linux.intel.com wrote:
> From: Hang Yuan <hang.yuan@linux.intel.com>
>=20
> Add EDID region for vGPU and support EDID update via this region.
>=20
> Signed-off-by: Hang Yuan <hang.yuan@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/gvt/gvt.h       |   1 +
>  drivers/gpu/drm/i915/gvt/hypercall.h |   1 +
>  drivers/gpu/drm/i915/gvt/kvmgt.c     | 119 +++++++++++++++++++++++++++++=
++++++
>  drivers/gpu/drm/i915/gvt/mpt.h       |  17 +++++
>  drivers/gpu/drm/i915/gvt/vgpu.c      |   6 ++
>  5 files changed, 144 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/gvt.h b/drivers/gpu/drm/i915/gvt/gv=
t.h
> index 8bce09d..54ad341 100644
> --- a/drivers/gpu/drm/i915/gvt/gvt.h
> +++ b/drivers/gpu/drm/i915/gvt/gvt.h
> @@ -203,6 +203,7 @@ struct intel_vgpu {
>  	struct {
>  		struct mdev_device *mdev;
>  		struct vfio_region *region;
> +		struct vfio_region_gfx_edid vfio_edid_regs;
>  		int num_regions;
>  		struct eventfd_ctx *intx_trigger;
>  		struct eventfd_ctx *msi_trigger;
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
> index 5bec0b5..a667081 100644
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
> @@ -427,6 +429,92 @@ static const struct intel_vgpu_regops intel_vgpu_reg=
ops_opregion =3D {
>  	.release =3D intel_vgpu_reg_release_opregion,
>  };
> =20
> +static int handle_edid_regs(struct intel_vgpu *vgpu, char *buf, size_t c=
ount,
> +		u16 offset, bool is_write)
> +{
> +	struct vfio_region_gfx_edid *regs =3D (void *)&vgpu->vdev.vfio_edid_reg=
s;
> +
> +	if (offset + count > sizeof(vgpu->vdev.vfio_edid_regs))
> +		return -EINVAL;
> +
> +	if (count !=3D 4)
> +		return -EINVAL;
> +
> +	if (is_write) {
> +		switch (offset) {
> +		case offsetof(struct vfio_region_gfx_edid, link_state):
> +			memcpy((char *)regs + offset, buf, count);
> +			if (regs->link_state =3D=3D VFIO_DEVICE_GFX_LINK_STATE_UP)
> +				intel_gvt_ops->emulate_hotplug(vgpu, true);
> +			else if (regs->link_state
> +					=3D=3D VFIO_DEVICE_GFX_LINK_STATE_DOWN)
> +				intel_gvt_ops->emulate_hotplug(vgpu, false);
> +			else {
> +				gvt_vgpu_err("invalid EDID link state %d\n",
> +					regs->link_state);
> +				return -EINVAL;
> +			}
> +			break;
> +		default:
> +			/* read-only regs */
> +			gvt_vgpu_err("write read-only EDID region at offset %d\n",
> +				offset);
> +			return -EPERM;
> +		}

"edid_size" is also writable for user, so need to check or bail with
different error. And we might at least do some validation of passed
edid blob for sanity.

> +	} else {
> +		memcpy(buf, (char *)regs + offset, count);
> +	}
> +
> +	return count;
> +}
> +
> +static int handle_edid_blob(struct intel_vgpu *vgpu, char *base, char *b=
uf,
> +		size_t count, u16 offset, bool is_write)
> +{
> +	if (offset + count > vgpu->vdev.vfio_edid_regs.edid_size)
> +		return -EINVAL;
> +
> +	if (is_write)
> +		memcpy(base + offset, buf, count);
> +	else
> +		memcpy(buf, base + offset, count);
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
> +	void *base =3D vgpu->vdev.region[i].data;
> +	loff_t pos =3D *ppos & VFIO_PCI_OFFSET_MASK;
> +
> +	if (pos < EDID_BLOB_OFFSET) {
> +		ret =3D handle_edid_regs(vgpu, buf, count, pos, iswrite);
> +	} else {
> +		pos -=3D EDID_BLOB_OFFSET;
> +		ret =3D handle_edid_blob(vgpu, base, buf, count, pos, iswrite);
> +	}
> +
> +	if (ret < 0)
> +		gvt_vgpu_err("failed to access EDID region at offset 0x%llx\n",
> +				pos);
> +
> +	return ret;
> +}
> +
> +static void intel_vgpu_reg_release_edid(struct intel_vgpu *vgpu,
> +					struct vfio_region *region)
> +{
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
> @@ -493,6 +581,36 @@ static int kvmgt_set_opregion(void *p_vgpu)
>  	return ret;
>  }
> =20
> +static int kvmgt_set_edid(void *p_vgpu, int port_num)
> +{
> +	struct intel_vgpu *vgpu =3D (struct intel_vgpu *)p_vgpu;
> +	struct intel_vgpu_port *port =3D intel_vgpu_port(vgpu, port_num);
> +	void *base;
> +	int ret;
> +
> +	base =3D port->edid->edid_block;
> +	if (!base)
> +		return -ENOMEM;
> +
> +	vgpu->vdev.vfio_edid_regs.edid_offset =3D EDID_BLOB_OFFSET;
> +
> +	/* No extended EDID block for DP interface */
> +	vgpu->vdev.vfio_edid_regs.edid_max_size =3D EDID_SIZE;
> +	vgpu->vdev.vfio_edid_regs.edid_size =3D EDID_SIZE;
> +	vgpu->vdev.vfio_edid_regs.max_xres =3D vgpu_edid_xres(port->id);
> +	vgpu->vdev.vfio_edid_regs.max_yres =3D vgpu_edid_yres(port->id);
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
> @@ -1896,6 +2014,7 @@ static struct intel_gvt_mpt kvmgt_mpt =3D {
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

--vGgW1X5XWziG23Ko
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXEALPQAKCRCxBBozTXgY
J+AgAJ9hoRAZE4G/3mm6uZgK2RT2pt0u3ACfciIZBqFsEvlkGGbl3pipcvaVG1w=
=HbwG
-----END PGP SIGNATURE-----

--vGgW1X5XWziG23Ko--

--===============1803193660==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2
Cg==

--===============1803193660==--
