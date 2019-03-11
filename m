Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:5a0b:0:0:0:0:0 with SMTP id o11csp985365ywb;
        Sun, 10 Mar 2019 20:30:13 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxbw9iHiNfCtDK5csST7AKCNIJR5uVE6ZIik7ZrNQHQd20EPQNKBlRYXqzKt50ae7K29pV3
X-Received: by 2002:a17:902:7784:: with SMTP id o4mr3265554pll.152.1552275012985;
        Sun, 10 Mar 2019 20:30:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552275012; cv=none;
        d=google.com; s=arc-20160816;
        b=OEiB+kHgy9c5iYWJDgAIzzKM1b+Whxxz1tUJRAteUV/2IgXvAzSdbJo//UGGh2aGUK
         vAzxxUK0W3pAPingF0HOcykFkRzgSGsfmky7vpSuYAIGMxRQGyfro58zfzUgK/JekDMW
         /3PiuMR2nk3VHpS60zzm+i1fFOBAya/I73PVPMuY0YxK7/SR/1Q4KQIc4s+3vEbOxt4y
         e9zk6t+IWMtFFhzqx4s+10NVVjmpPR8Qr43LdhqCqufLlloFBx8Hw2+CgRXAvQRrsn6H
         bcemkjC3jySv+6nrGwnGP6xs//OEJBdrfFdoxM43HbVtle+cr2zG/IcN1jMJA3kFBTa0
         N9yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:mime-version:references:message-id:subject:to:from:date
         :delivered-to;
        bh=jIFur7oGBckBY5abN9awUXlxHFRDi1R2yxMybJEU8Gk=;
        b=DP2ztT5t2e3xcAxTWdQeOuK9mjvxV8256az3vDzd2IJ+zm2U2jILoSwXkXOJ/FXAcR
         2b8kAV5GI7fl/QCtfQM55M7RqkP7TXeY5GQxb2tHh29lCs6TvSFWfFJbE/kcCfZ4tc99
         xD2jxhpwIOrpD2Eyzed61PtHaf74UFzj3wrBbZXUnJyWPR4NTFKuR4NZmjbPoVxoJ1QK
         s3q1PyMBgyNHTJhlJH/ddBNFLJfbM1Tv71zUroU8X7QpPs7izfVUTRexCwO8JTgnNt2Z
         lwaPyJDLMIcJ4WVNJwGltr3VgxOduPsZ8WYWCwZxhVi2nrB8viiAxtLeNn7chFWgZKzS
         GlIw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id g127si4051081pgc.313.2019.03.10.20.30.11
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 10 Mar 2019 20:30:12 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 565CC89AC3;
	Mon, 11 Mar 2019 03:30:11 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EEC389AC3
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 11 Mar 2019 03:30:10 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Mar 2019 20:30:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,466,1544515200"; 
 d="asc'?scan'208";a="139663730"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.13.116])
 by FMSMGA003.fm.intel.com with ESMTP; 10 Mar 2019 20:30:04 -0700
Date: Mon, 11 Mar 2019 11:19:51 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Yan Zhao <yan.y.zhao@intel.com>
Subject: Re: [PATCH v5 2/2] drm/i915/gvt: code refine of lri cmd parser
Message-ID: <20190311031951.GF12380@zhen-hp.sh.intel.com>
References: <20190311014045.13977-1-yan.y.zhao@intel.com>
 <20190311014214.14057-1-yan.y.zhao@intel.com>
MIME-Version: 1.0
In-Reply-To: <20190311014214.14057-1-yan.y.zhao@intel.com>
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
Cc: intel-gvt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0751493828=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============0751493828==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="XA7quakUSnawneuz"
Content-Disposition: inline


--XA7quakUSnawneuz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


Can you write title that reflect real change for this? e.g not just say cod=
e refine.

On 2019.03.10 21:42:14 -0400, Yan Zhao wrote:
> do not create a separate function intel_vgpu_mask_mmio_write()
> but use intel_vgpu_mmio_reg_rw() for consistency.
>=20
> Fixes:
> commit 6cef21a19649 ("drm/i915/gvt: update vreg on inhibit context lri
> command")

This shouldn't be taken as Fixes, it's a refactor or cleanup, right?

>=20
> v5: remove intel_vgpu_mask_mmio_write in mmio.h
> v4: check return value of intel_vgpu_mmio_reg_rw()
>=20
> Signed-off-by: Yan Zhao <yan.y.zhao@intel.com>
> ---
>  drivers/gpu/drm/i915/gvt/cmd_parser.c | 11 +++++------
>  drivers/gpu/drm/i915/gvt/handlers.c   | 24 ------------------------
>  drivers/gpu/drm/i915/gvt/mmio.h       |  2 --
>  3 files changed, 5 insertions(+), 32 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/cmd_parser.c b/drivers/gpu/drm/i915=
/gvt/cmd_parser.c
> index 3592d04c33b2..26a6bfc7065c 100644
> --- a/drivers/gpu/drm/i915/gvt/cmd_parser.c
> +++ b/drivers/gpu/drm/i915/gvt/cmd_parser.c
> @@ -909,13 +909,12 @@ static int cmd_reg_handler(struct parser_exec_state=
 *s,
>  			s->workload->ring_context_gpa + 12, &ctx_sr_ctl, 4);
>  		/* check inhibit context */
>  		if (ctx_sr_ctl & 1) {
> +			int ret =3D 0;
>  			u32 data =3D cmd_val(s, index + 1);
> -
> -			if (intel_gvt_mmio_has_mode_mask(s->vgpu->gvt, offset))
> -				intel_vgpu_mask_mmio_write(vgpu,
> -							offset, &data, 4);
> -			else
> -				vgpu_vreg(vgpu, offset) =3D data;
> +			ret =3D intel_vgpu_mmio_reg_rw(s->vgpu, offset,
> +					&data, 4, false);
> +			if (ret)
> +				return ret;
>  		}
>  	}
> =20
> diff --git a/drivers/gpu/drm/i915/gvt/handlers.c b/drivers/gpu/drm/i915/g=
vt/handlers.c
> index 54bd0b033298..545154af93e9 100644
> --- a/drivers/gpu/drm/i915/gvt/handlers.c
> +++ b/drivers/gpu/drm/i915/gvt/handlers.c
> @@ -3401,30 +3401,6 @@ int intel_vgpu_default_mmio_write(struct intel_vgp=
u *vgpu, unsigned int offset,
>  	return 0;
>  }
> =20
> -/**
> - * intel_vgpu_mask_mmio_write - write mask register
> - * @vgpu: a vGPU
> - * @offset: access offset
> - * @p_data: write data buffer
> - * @bytes: access data length
> - *
> - * Returns:
> - * Zero on success, negative error code if failed.
> - */
> -int intel_vgpu_mask_mmio_write(struct intel_vgpu *vgpu, unsigned int off=
set,
> -		void *p_data, unsigned int bytes)
> -{
> -	u32 mask, old_vreg;
> -
> -	old_vreg =3D vgpu_vreg(vgpu, offset);
> -	write_vreg(vgpu, offset, p_data, bytes);
> -	mask =3D vgpu_vreg(vgpu, offset) >> 16;
> -	vgpu_vreg(vgpu, offset) =3D (old_vreg & ~mask) |
> -				(vgpu_vreg(vgpu, offset) & mask);
> -
> -	return 0;
> -}
> -
>  /**
>   * intel_gvt_in_force_nonpriv_whitelist - if a mmio is in whitelist to be
>   * force-nopriv register
> diff --git a/drivers/gpu/drm/i915/gvt/mmio.h b/drivers/gpu/drm/i915/gvt/m=
mio.h
> index 5874f1cb4306..2a8ae8898265 100644
> --- a/drivers/gpu/drm/i915/gvt/mmio.h
> +++ b/drivers/gpu/drm/i915/gvt/mmio.h
> @@ -100,6 +100,4 @@ bool intel_gvt_in_force_nonpriv_whitelist(struct inte=
l_gvt *gvt,
>  int intel_vgpu_mmio_reg_rw(struct intel_vgpu *vgpu, unsigned int offset,
>  			   void *pdata, unsigned int bytes, bool is_read);
> =20
> -int intel_vgpu_mask_mmio_write(struct intel_vgpu *vgpu, unsigned int off=
set,
> -				  void *p_data, unsigned int bytes);
>  #endif
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

--XA7quakUSnawneuz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXIXT1wAKCRCxBBozTXgY
J6iQAJ48WXNvCwwwr+C7FVta6wgFm0rIJgCbBJ8z6rkqfGKEVgj46iBmzOmb334=
=SHi+
-----END PGP SIGNATURE-----

--XA7quakUSnawneuz--

--===============0751493828==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2

--===============0751493828==--
