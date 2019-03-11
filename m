Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:5a0b:0:0:0:0:0 with SMTP id o11csp1228839ywb;
        Mon, 11 Mar 2019 03:06:10 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwyi3SJ763shTXDsnWQEN4bQxyMxitq1ypjU7uUA/mw1i4i8MKurE1s34N3CD5E2/Jdj+pg
X-Received: by 2002:aa7:930b:: with SMTP id 11mr32438170pfj.49.1552298770120;
        Mon, 11 Mar 2019 03:06:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552298770; cv=none;
        d=google.com; s=arc-20160816;
        b=TLBVz0LFgc291P7Z5VKe9nZgWCBDqiLqpIyQmJZStJDzxyrap6BULLEb9yhMbnJKNu
         GZrvuU2URydwiX4xXygikZU483qrlXXK6XCsVZbZXwEDcsCpDtgG8Rnm9dZXXFm8e3HU
         ZbvV4/f56dCLBaLhsq1f7QIhHP47yS/ALjngwMeLY6qpj5YLHon9GoBC1H97OmKu3qTC
         NxRiejAEuC385ihO2m/YMd+AGfAaK3WWm2qIFIB0eXSUPdmM2YrLuL5+KgamE55Q2ZFh
         Zk9D/J1t+cxWOjEmMpqSJSTK/SaH0G9hjNPW4uaObKIAEbVEIBLE2QplPKky8luHZHqx
         yrgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:mime-version:references:message-id:subject:to:from:date
         :delivered-to;
        bh=fxggl+5jsNOWKYZrBf4+b5thQTPUFsaAA3Lp9VAxU2w=;
        b=M3Ce6g9kdzy8BTKVNevG2FVkAPp78/Ex3U/YOVMBczgQfKhv7dFEvc3gFtu7qKnden
         8K9tOEvCloWhGMWxlRkNk3v6V47haV3aVrPNVOaksPoeScRSxZ6W6I0agPjbu6YljRHk
         gxy9iHrVFK0KhbTpbB/IcntGwA7UQKcMa0xA3+7WCJo+bpbbwVqkuVHNtCH0k6pIVdYH
         UDlDxEQot4+Agb7A8pXiPQZ3jQ5+4j1qtNsh8X+hnXaqttIyyze/U1l/TEr44y7gPxtJ
         brszXYizaW3VTIBgjzbX2L/UUIUbVEWLnAGJT7NvLm1+PMqa2B4q78dwUxA/1iuz28b1
         CdPA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id az2si4866860plb.252.2019.03.11.03.06.09
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Mar 2019 03:06:10 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F8D289956;
	Mon, 11 Mar 2019 10:06:09 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B42889956
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 11 Mar 2019 10:06:08 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Mar 2019 03:06:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,467,1544515200"; 
 d="asc'?scan'208";a="139740591"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.13.116])
 by FMSMGA003.fm.intel.com with ESMTP; 11 Mar 2019 03:06:06 -0700
Date: Mon, 11 Mar 2019 17:55:53 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: "Yuan, Hang" <hang.yuan@intel.com>
Subject: Re: [PATCH v6 2/2] drm/i915/gvt: call common mmio rw routine for
 vreg update in lri cmd parser
Message-ID: <20190311095553.GL12380@zhen-hp.sh.intel.com>
References: <20190311014214.14057-1-yan.y.zhao@intel.com>
 <20190311045200.20014-1-yan.y.zhao@intel.com>
 <C294FBAE55175941838A8D362DCD8AA225EBCF15@SHSMSX104.ccr.corp.intel.com>
MIME-Version: 1.0
In-Reply-To: <C294FBAE55175941838A8D362DCD8AA225EBCF15@SHSMSX104.ccr.corp.intel.com>
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
Cc: "intel-gvt-dev@lists.freedesktop.org"
 <intel-gvt-dev@lists.freedesktop.org>, "Zhao, Yan Y" <yan.y.zhao@intel.com>
Content-Type: multipart/mixed; boundary="===============1444145370=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============1444145370==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Z0vT1GPDkB6ir2Vi"
Content-Disposition: inline


--Z0vT1GPDkB6ir2Vi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2019.03.11 09:17:52 +0000, Yuan, Hang wrote:
> Just have concern that intel_vgpu_mmio_reg_rw()does emulate register's be=
havior as well but cmd_reg_handler() just saves register's value in vreg.
>=20

yeah, extra write handler would be called, although I believe that's expect=
ed
behavior to handle mmio write in LRI cmd as well, we should still tell expl=
icitly
instead of noting this as only a code refinement..

>=20
> > -----Original Message-----
> > From: intel-gvt-dev [mailto:intel-gvt-dev-bounces@lists.freedesktop.org=
] On
> > Behalf Of Yan Zhao
> > Sent: Monday, March 11, 2019 12:52 PM
> > To: intel-gvt-dev@lists.freedesktop.org
> > Cc: Zhao, Yan Y <yan.y.zhao@intel.com>
> > Subject: [PATCH v6 2/2] drm/i915/gvt: call common mmio rw routine for v=
reg
> > update in lri cmd parser
> >=20
> > in cmd parser, when there's a need to update vregs according to commands
> > being parsed, do not create a separate function
> > intel_vgpu_mask_mmio_write(), but call intel_vgpu_mmio_reg_rw() to keep
> > consistent with handling behavior for CPU read/write of mmio.
> >=20
> > This patch is a code refinement to
> > commit 6cef21a19649 ("drm/i915/gvt: update vreg on inhibit context lri
> > command")
> >=20
> > v6: update commit message (zhenyu wang)
> > v5: remove intel_vgpu_mask_mmio_write in mmio.h
> > v4: check return value of intel_vgpu_mmio_reg_rw()
> >=20
> > Signed-off-by: Yan Zhao <yan.y.zhao@intel.com>
> > ---
> >  drivers/gpu/drm/i915/gvt/cmd_parser.c | 11 +++++------
> >  drivers/gpu/drm/i915/gvt/handlers.c   | 24 ------------------------
> >  drivers/gpu/drm/i915/gvt/mmio.h       |  2 --
> >  3 files changed, 5 insertions(+), 32 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/i915/gvt/cmd_parser.c
> > b/drivers/gpu/drm/i915/gvt/cmd_parser.c
> > index 3592d04c33b2..26a6bfc7065c 100644
> > --- a/drivers/gpu/drm/i915/gvt/cmd_parser.c
> > +++ b/drivers/gpu/drm/i915/gvt/cmd_parser.c
> > @@ -909,13 +909,12 @@ static int cmd_reg_handler(struct
> > parser_exec_state *s,
> >  			s->workload->ring_context_gpa + 12, &ctx_sr_ctl, 4);
> >  		/* check inhibit context */
> >  		if (ctx_sr_ctl & 1) {
> > +			int ret =3D 0;
> >  			u32 data =3D cmd_val(s, index + 1);
> > -
> > -			if (intel_gvt_mmio_has_mode_mask(s->vgpu->gvt,
> > offset))
> > -				intel_vgpu_mask_mmio_write(vgpu,
> > -							offset, &data, 4);
> > -			else
> > -				vgpu_vreg(vgpu, offset) =3D data;
> > +			ret =3D intel_vgpu_mmio_reg_rw(s->vgpu, offset,
> > +					&data, 4, false);
> > +			if (ret)
> > +				return ret;
> >  		}
> >  	}
> >=20
> > diff --git a/drivers/gpu/drm/i915/gvt/handlers.c
> > b/drivers/gpu/drm/i915/gvt/handlers.c
> > index 54bd0b033298..545154af93e9 100644
> > --- a/drivers/gpu/drm/i915/gvt/handlers.c
> > +++ b/drivers/gpu/drm/i915/gvt/handlers.c
> > @@ -3401,30 +3401,6 @@ int intel_vgpu_default_mmio_write(struct
> > intel_vgpu *vgpu, unsigned int offset,
> >  	return 0;
> >  }
> >=20
> > -/**
> > - * intel_vgpu_mask_mmio_write - write mask register
> > - * @vgpu: a vGPU
> > - * @offset: access offset
> > - * @p_data: write data buffer
> > - * @bytes: access data length
> > - *
> > - * Returns:
> > - * Zero on success, negative error code if failed.
> > - */
> > -int intel_vgpu_mask_mmio_write(struct intel_vgpu *vgpu, unsigned int
> > offset,
> > -		void *p_data, unsigned int bytes)
> > -{
> > -	u32 mask, old_vreg;
> > -
> > -	old_vreg =3D vgpu_vreg(vgpu, offset);
> > -	write_vreg(vgpu, offset, p_data, bytes);
> > -	mask =3D vgpu_vreg(vgpu, offset) >> 16;
> > -	vgpu_vreg(vgpu, offset) =3D (old_vreg & ~mask) |
> > -				(vgpu_vreg(vgpu, offset) & mask);
> > -
> > -	return 0;
> > -}
> > -
> >  /**
> >   * intel_gvt_in_force_nonpriv_whitelist - if a mmio is in whitelist to=
 be
> >   * force-nopriv register
> > diff --git a/drivers/gpu/drm/i915/gvt/mmio.h
> > b/drivers/gpu/drm/i915/gvt/mmio.h index 5874f1cb4306..2a8ae8898265
> > 100644
> > --- a/drivers/gpu/drm/i915/gvt/mmio.h
> > +++ b/drivers/gpu/drm/i915/gvt/mmio.h
> > @@ -100,6 +100,4 @@ bool intel_gvt_in_force_nonpriv_whitelist(struct
> > intel_gvt *gvt,  int intel_vgpu_mmio_reg_rw(struct intel_vgpu *vgpu,
> > unsigned int offset,
> >  			   void *pdata, unsigned int bytes, bool is_read);
> >=20
> > -int intel_vgpu_mask_mmio_write(struct intel_vgpu *vgpu, unsigned int
> > offset,
> > -				  void *p_data, unsigned int bytes);
> >  #endif
> > --
> > 2.17.1
> >=20
> > _______________________________________________
> > intel-gvt-dev mailing list
> > intel-gvt-dev@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
> _______________________________________________
> intel-gvt-dev mailing list
> intel-gvt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--Z0vT1GPDkB6ir2Vi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXIYwqQAKCRCxBBozTXgY
J+TeAJ9ejaJgPAIw4g2onscYsLGTjkv43QCdHA4PJO9m9K7KKPKrODKyH8VspLY=
=XkOe
-----END PGP SIGNATURE-----

--Z0vT1GPDkB6ir2Vi--

--===============1444145370==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2

--===============1444145370==--
