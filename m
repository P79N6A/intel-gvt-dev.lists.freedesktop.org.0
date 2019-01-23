Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a0d:d7d3:0:0:0:0:0 with SMTP id z202csp297474ywd;
        Tue, 22 Jan 2019 21:52:48 -0800 (PST)
X-Google-Smtp-Source: ALg8bN4gEELnVbjCqE/r9H/Qb7qbfUsI50vGOa3M7I0FFA0kkIFGw7MCf+JaBiGrrddMxAgVx0qz
X-Received: by 2002:a62:1e45:: with SMTP id e66mr895636pfe.152.1548222768378;
        Tue, 22 Jan 2019 21:52:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548222768; cv=none;
        d=google.com; s=arc-20160816;
        b=cfJFfP26DzLaAJsqA6lhr5f9Vs3p3Fu5bJ0MVx9UYdZTXe/p1LnDXllXz5Gq+Mrfee
         95qKZNpt/WUYn+dz0dPrnmDc/PeYYxb4IV2+lDJnPaumU/bNPchcYc9VlRd0tqDAAQjF
         VIAIf8W/44nxb0qrjhpHN1tIFyAUsgyDeCQl/krgU6CscjI3fADvH9DWUfP+Cc03hZuU
         CVkhp5ajvSHHGE8PekA3ODeEjLSJkrlI6umfaIM+TOJ1s5ATkFM0cERzex0KzGvhkMZ2
         E1VyZ2PV1JcqRbzi1Rakqmknt1mNT04ACqJtei8yRabOxGop9iBKpYjULVLZ+1Q+cjGv
         qV+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:mime-version:references:message-id:subject:to:from:date
         :delivered-to;
        bh=SSQLBaGcQArBul9rnl7xGA6Yo+nejbxMgjoEBXKLOZA=;
        b=aPF2ufrtve+B9Rn32smaZNfMuwCeu3jXb+n01kIkVqWrYcB8EMBgtcIxbBcUZUCMhZ
         wbhypHSkBxGkL5A/UF9Br0Adr+VoPMLYi6GoMkc3IHrRNbRz8fmtsaE5jUcFcgeED3zY
         a3tupus7aKtuHkO4rD9qpx5Wje9/we/KupQZfaKkO3uH5P1HovrDYuzyVC3Gx2wqy9QE
         ck8s7IL2/r+//8c5wUNqMajK2k3D7HxZnO7ngm4sFPeuD3bepEWiSqkDjsroEW8Xb3o5
         qb16PZZsCFl9VkaI8mo2RaKr/xJu1z2WX3+GKcwzH8RnvTY8DuRlsF93Qc+qplu50Yev
         CxtQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id s62si19242988pgc.113.2019.01.22.21.52.47
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 22 Jan 2019 21:52:48 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E99F6EE53;
	Wed, 23 Jan 2019 05:52:47 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BFA46EE53;
 Wed, 23 Jan 2019 05:52:46 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Jan 2019 21:52:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,509,1539673200"; 
 d="asc'?scan'208";a="269159639"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.13.116])
 by orsmga004.jf.intel.com with ESMTP; 22 Jan 2019 21:52:44 -0800
Date: Wed, 23 Jan 2019 13:44:10 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH] drm/i915/gvt: switch to kernel types
Message-ID: <20190123054410.GD7203@zhen-hp.sh.intel.com>
References: <20190121095141.885-1-jani.nikula@intel.com>
MIME-Version: 1.0
In-Reply-To: <20190121095141.885-1-jani.nikula@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0168504202=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============0168504202==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="WIyZ46R2i8wDzkSu"
Content-Disposition: inline


--WIyZ46R2i8wDzkSu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2019.01.21 11:51:41 +0200, Jani Nikula wrote:
> Mixed C99 and kernel types use is getting ugly. Prefer kernel types.
>=20
> sed -i 's/\buint\(8\|16\|32\|64\)_t\b/u\1/g'
>=20
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---

Looks good to me.

Acked-by: Zhenyu Wang <zhenyuw@linux.intel.com>

Will queue this up. Thanks!

>  drivers/gpu/drm/i915/gvt/cmd_parser.c   | 14 +++++++-------
>  drivers/gpu/drm/i915/gvt/handlers.c     |  6 +++---
>  drivers/gpu/drm/i915/gvt/kvmgt.c        | 24 ++++++++++++------------
>  drivers/gpu/drm/i915/gvt/mmio.c         |  6 +++---
>  drivers/gpu/drm/i915/gvt/sched_policy.c |  2 +-
>  drivers/gpu/drm/i915/gvt/scheduler.h    |  2 +-
>  6 files changed, 27 insertions(+), 27 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/cmd_parser.c b/drivers/gpu/drm/i915=
/gvt/cmd_parser.c
> index 77ae634eb11c..bac014031c4b 100644
> --- a/drivers/gpu/drm/i915/gvt/cmd_parser.c
> +++ b/drivers/gpu/drm/i915/gvt/cmd_parser.c
> @@ -399,10 +399,10 @@ struct cmd_info {
>  #define R_VECS	(1 << VECS)
>  #define R_ALL (R_RCS | R_VCS | R_BCS | R_VECS)
>  	/* rings that support this cmd: BLT/RCS/VCS/VECS */
> -	uint16_t rings;
> +	u16 rings;
> =20
>  	/* devices that support this cmd: SNB/IVB/HSW/... */
> -	uint16_t devices;
> +	u16 devices;
> =20
>  	/* which DWords are address that need fix up.
>  	 * bit 0 means a 32-bit non address operand in command
> @@ -412,13 +412,13 @@ struct cmd_info {
>  	 * No matter the address length, each address only takes
>  	 * one bit in the bitmap.
>  	 */
> -	uint16_t addr_bitmap;
> +	u16 addr_bitmap;
> =20
>  	/* flag =3D=3D F_LEN_CONST : command length
>  	 * flag =3D=3D F_LEN_VAR : length bias bits
>  	 * Note: length is in DWord
>  	 */
> -	uint8_t	len;
> +	u8 len;
> =20
>  	parser_cmd_handler handler;
>  };
> @@ -1644,7 +1644,7 @@ static int find_bb_size(struct parser_exec_state *s=
, unsigned long *bb_size)
>  {
>  	unsigned long gma =3D 0;
>  	struct cmd_info *info;
> -	uint32_t cmd_len =3D 0;
> +	u32 cmd_len =3D 0;
>  	bool bb_end =3D false;
>  	struct intel_vgpu *vgpu =3D s->vgpu;
>  	u32 cmd;
> @@ -2683,7 +2683,7 @@ static int scan_wa_ctx(struct intel_shadow_wa_ctx *=
wa_ctx)
>  					I915_GTT_PAGE_SIZE)))
>  		return -EINVAL;
> =20
> -	ring_tail =3D wa_ctx->indirect_ctx.size + 3 * sizeof(uint32_t);
> +	ring_tail =3D wa_ctx->indirect_ctx.size + 3 * sizeof(u32);
>  	ring_size =3D round_up(wa_ctx->indirect_ctx.size + CACHELINE_BYTES,
>  			PAGE_SIZE);
>  	gma_head =3D wa_ctx->indirect_ctx.guest_gma;
> @@ -2850,7 +2850,7 @@ static int shadow_indirect_ctx(struct intel_shadow_=
wa_ctx *wa_ctx)
> =20
>  static int combine_wa_ctx(struct intel_shadow_wa_ctx *wa_ctx)
>  {
> -	uint32_t per_ctx_start[CACHELINE_DWORDS] =3D {0};
> +	u32 per_ctx_start[CACHELINE_DWORDS] =3D {0};
>  	unsigned char *bb_start_sva;
> =20
>  	if (!wa_ctx->per_ctx.valid)
> diff --git a/drivers/gpu/drm/i915/gvt/handlers.c b/drivers/gpu/drm/i915/g=
vt/handlers.c
> index e9f343b124b0..2837baa55128 100644
> --- a/drivers/gpu/drm/i915/gvt/handlers.c
> +++ b/drivers/gpu/drm/i915/gvt/handlers.c
> @@ -276,7 +276,7 @@ static int mul_force_wake_write(struct intel_vgpu *vg=
pu,
>  		unsigned int offset, void *p_data, unsigned int bytes)
>  {
>  	u32 old, new;
> -	uint32_t ack_reg_offset;
> +	u32 ack_reg_offset;
> =20
>  	old =3D vgpu_vreg(vgpu, offset);
>  	new =3D CALC_MODE_MASK_REG(old, *(u32 *)p_data);
> @@ -833,7 +833,7 @@ static int dp_aux_ch_ctl_trans_done(struct intel_vgpu=
 *vgpu, u32 value,
>  }
> =20
>  static void dp_aux_ch_ctl_link_training(struct intel_vgpu_dpcd_data *dpc=
d,
> -		uint8_t t)
> +		u8 t)
>  {
>  	if ((t & DPCD_TRAINING_PATTERN_SET_MASK) =3D=3D DPCD_TRAINING_PATTERN_1=
) {
>  		/* training pattern 1 for CR */
> @@ -919,7 +919,7 @@ static int dp_aux_ch_ctl_mmio_write(struct intel_vgpu=
 *vgpu,
> =20
>  	if (op =3D=3D GVT_AUX_NATIVE_WRITE) {
>  		int t;
> -		uint8_t buf[16];
> +		u8 buf[16];
> =20
>  		if ((addr + len + 1) >=3D DPCD_SIZE) {
>  			/*
> diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/=
kvmgt.c
> index dd3dfd00f4e6..413c6a13ec02 100644
> --- a/drivers/gpu/drm/i915/gvt/kvmgt.c
> +++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
> @@ -703,7 +703,7 @@ static void intel_vgpu_release_work(struct work_struc=
t *work)
>  	__intel_vgpu_release(vgpu);
>  }
> =20
> -static uint64_t intel_vgpu_get_bar_addr(struct intel_vgpu *vgpu, int bar)
> +static u64 intel_vgpu_get_bar_addr(struct intel_vgpu *vgpu, int bar)
>  {
>  	u32 start_lo, start_hi;
>  	u32 mem_type;
> @@ -730,10 +730,10 @@ static uint64_t intel_vgpu_get_bar_addr(struct inte=
l_vgpu *vgpu, int bar)
>  	return ((u64)start_hi << 32) | start_lo;
>  }
> =20
> -static int intel_vgpu_bar_rw(struct intel_vgpu *vgpu, int bar, uint64_t =
off,
> +static int intel_vgpu_bar_rw(struct intel_vgpu *vgpu, int bar, u64 off,
>  			     void *buf, unsigned int count, bool is_write)
>  {
> -	uint64_t bar_start =3D intel_vgpu_get_bar_addr(vgpu, bar);
> +	u64 bar_start =3D intel_vgpu_get_bar_addr(vgpu, bar);
>  	int ret;
> =20
>  	if (is_write)
> @@ -745,13 +745,13 @@ static int intel_vgpu_bar_rw(struct intel_vgpu *vgp=
u, int bar, uint64_t off,
>  	return ret;
>  }
> =20
> -static inline bool intel_vgpu_in_aperture(struct intel_vgpu *vgpu, uint6=
4_t off)
> +static inline bool intel_vgpu_in_aperture(struct intel_vgpu *vgpu, u64 o=
ff)
>  {
>  	return off >=3D vgpu_aperture_offset(vgpu) &&
>  	       off < vgpu_aperture_offset(vgpu) + vgpu_aperture_sz(vgpu);
>  }
> =20
> -static int intel_vgpu_aperture_rw(struct intel_vgpu *vgpu, uint64_t off,
> +static int intel_vgpu_aperture_rw(struct intel_vgpu *vgpu, u64 off,
>  		void *buf, unsigned long count, bool is_write)
>  {
>  	void *aperture_va;
> @@ -783,7 +783,7 @@ static ssize_t intel_vgpu_rw(struct mdev_device *mdev=
, char *buf,
>  {
>  	struct intel_vgpu *vgpu =3D mdev_get_drvdata(mdev);
>  	unsigned int index =3D VFIO_PCI_OFFSET_TO_INDEX(*ppos);
> -	uint64_t pos =3D *ppos & VFIO_PCI_OFFSET_MASK;
> +	u64 pos =3D *ppos & VFIO_PCI_OFFSET_MASK;
>  	int ret =3D -EINVAL;
> =20
> =20
> @@ -1039,7 +1039,7 @@ static int intel_vgpu_get_irq_count(struct intel_vg=
pu *vgpu, int type)
> =20
>  static int intel_vgpu_set_intx_mask(struct intel_vgpu *vgpu,
>  			unsigned int index, unsigned int start,
> -			unsigned int count, uint32_t flags,
> +			unsigned int count, u32 flags,
>  			void *data)
>  {
>  	return 0;
> @@ -1047,21 +1047,21 @@ static int intel_vgpu_set_intx_mask(struct intel_=
vgpu *vgpu,
> =20
>  static int intel_vgpu_set_intx_unmask(struct intel_vgpu *vgpu,
>  			unsigned int index, unsigned int start,
> -			unsigned int count, uint32_t flags, void *data)
> +			unsigned int count, u32 flags, void *data)
>  {
>  	return 0;
>  }
> =20
>  static int intel_vgpu_set_intx_trigger(struct intel_vgpu *vgpu,
>  		unsigned int index, unsigned int start, unsigned int count,
> -		uint32_t flags, void *data)
> +		u32 flags, void *data)
>  {
>  	return 0;
>  }
> =20
>  static int intel_vgpu_set_msi_trigger(struct intel_vgpu *vgpu,
>  		unsigned int index, unsigned int start, unsigned int count,
> -		uint32_t flags, void *data)
> +		u32 flags, void *data)
>  {
>  	struct eventfd_ctx *trigger;
> =20
> @@ -1080,12 +1080,12 @@ static int intel_vgpu_set_msi_trigger(struct inte=
l_vgpu *vgpu,
>  	return 0;
>  }
> =20
> -static int intel_vgpu_set_irqs(struct intel_vgpu *vgpu, uint32_t flags,
> +static int intel_vgpu_set_irqs(struct intel_vgpu *vgpu, u32 flags,
>  		unsigned int index, unsigned int start, unsigned int count,
>  		void *data)
>  {
>  	int (*func)(struct intel_vgpu *vgpu, unsigned int index,
> -			unsigned int start, unsigned int count, uint32_t flags,
> +			unsigned int start, unsigned int count, u32 flags,
>  			void *data) =3D NULL;
> =20
>  	switch (index) {
> diff --git a/drivers/gpu/drm/i915/gvt/mmio.c b/drivers/gpu/drm/i915/gvt/m=
mio.c
> index 43f65848ecd6..ed4df2f6d60b 100644
> --- a/drivers/gpu/drm/i915/gvt/mmio.c
> +++ b/drivers/gpu/drm/i915/gvt/mmio.c
> @@ -57,7 +57,7 @@ int intel_vgpu_gpa_to_mmio_offset(struct intel_vgpu *vg=
pu, u64 gpa)
>  	(reg >=3D gvt->device_info.gtt_start_offset \
>  	 && reg < gvt->device_info.gtt_start_offset + gvt_ggtt_sz(gvt))
> =20
> -static void failsafe_emulate_mmio_rw(struct intel_vgpu *vgpu, uint64_t p=
a,
> +static void failsafe_emulate_mmio_rw(struct intel_vgpu *vgpu, u64 pa,
>  		void *p_data, unsigned int bytes, bool read)
>  {
>  	struct intel_gvt *gvt =3D NULL;
> @@ -99,7 +99,7 @@ static void failsafe_emulate_mmio_rw(struct intel_vgpu =
*vgpu, uint64_t pa,
>   * Returns:
>   * Zero on success, negative error code if failed
>   */
> -int intel_vgpu_emulate_mmio_read(struct intel_vgpu *vgpu, uint64_t pa,
> +int intel_vgpu_emulate_mmio_read(struct intel_vgpu *vgpu, u64 pa,
>  		void *p_data, unsigned int bytes)
>  {
>  	struct intel_gvt *gvt =3D vgpu->gvt;
> @@ -171,7 +171,7 @@ int intel_vgpu_emulate_mmio_read(struct intel_vgpu *v=
gpu, uint64_t pa,
>   * Returns:
>   * Zero on success, negative error code if failed
>   */
> -int intel_vgpu_emulate_mmio_write(struct intel_vgpu *vgpu, uint64_t pa,
> +int intel_vgpu_emulate_mmio_write(struct intel_vgpu *vgpu, u64 pa,
>  		void *p_data, unsigned int bytes)
>  {
>  	struct intel_gvt *gvt =3D vgpu->gvt;
> diff --git a/drivers/gpu/drm/i915/gvt/sched_policy.c b/drivers/gpu/drm/i9=
15/gvt/sched_policy.c
> index f04b3b965bfc..1c763a27a412 100644
> --- a/drivers/gpu/drm/i915/gvt/sched_policy.c
> +++ b/drivers/gpu/drm/i915/gvt/sched_policy.c
> @@ -94,7 +94,7 @@ static void gvt_balance_timeslice(struct gvt_sched_data=
 *sched_data)
>  {
>  	struct vgpu_sched_data *vgpu_data;
>  	struct list_head *pos;
> -	static uint64_t stage_check;
> +	static u64 stage_check;
>  	int stage =3D stage_check++ % GVT_TS_BALANCE_STAGE_NUM;
> =20
>  	/* The timeslice accumulation reset at stage 0, which is
> diff --git a/drivers/gpu/drm/i915/gvt/scheduler.h b/drivers/gpu/drm/i915/=
gvt/scheduler.h
> index 2065cba59aab..0635b2c4bed7 100644
> --- a/drivers/gpu/drm/i915/gvt/scheduler.h
> +++ b/drivers/gpu/drm/i915/gvt/scheduler.h
> @@ -61,7 +61,7 @@ struct shadow_indirect_ctx {
>  	unsigned long guest_gma;
>  	unsigned long shadow_gma;
>  	void *shadow_va;
> -	uint32_t size;
> +	u32 size;
>  };
> =20
>  #define PER_CTX_ADDR_MASK 0xfffff000
> --=20
> 2.20.1
>=20
> _______________________________________________
> intel-gvt-dev mailing list
> intel-gvt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--WIyZ46R2i8wDzkSu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXEf/KgAKCRCxBBozTXgY
Jx9SAJ9Z7xs3cpP2K25RkCO/8ewtM0O5vgCeNOAdHtT472q9A4xHlOQr7+XmTzs=
=dGMZ
-----END PGP SIGNATURE-----

--WIyZ46R2i8wDzkSu--

--===============0168504202==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2
Cg==

--===============0168504202==--
