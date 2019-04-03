Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:ed4:0:0:0:0:0 with SMTP id 203csp3122ywo;
        Wed, 3 Apr 2019 02:21:54 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxtzPdOD4Q+Jvf0b5mw0/PepWyHLFN8y3kFZGORTSPlwnZPUJxoBt2otcDLGfK3DBPwhyJG
X-Received: by 2002:a62:6e05:: with SMTP id j5mr91144pfc.5.1554283314256;
        Wed, 03 Apr 2019 02:21:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1554283314; cv=none;
        d=google.com; s=arc-20160816;
        b=rXkoqayN13R1c2aQd6fa9SWU8WAq4ZvbxEsWcV7XtzyOowz2W9sdqCqI/81+xkLLr8
         u9pCGuOfR+8FFd835RpTYjmm6B9wabiHdL2Uf9qQqB50EifhgkR5fTmt0EBUMUNp7NwZ
         hQT8xIZ6Jc8FjDnWhK1ZS3aVtRj5igcYh26/Nre0GkkYNW8LIiW0kDXF5DxsAokK1L/n
         OXxjuup9GK9/NP893vtMTZDXgSweC13xKQJ0B69pzrmyBYFv2KN32r9C1xFnxet1Cb//
         iFZXrKKas0D2VRPVCJlMZ27Ysy1NvGWW07o+gugZ3WB56Q2DoJKqS0qU6r+CkLdndoy4
         Sugw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:mime-version:references:message-id:subject:to:from:date
         :delivered-to;
        bh=oTNGUhEln4zVdfS0D2WePuEwwqfgOEX9+0qNZP4YtUo=;
        b=DqFhs1Mws58PUFZQfhCNVRxiaZvE4Wp3jj7GBgFKOVN8c1qjDuU4FBszY/So2bel7N
         71TTyNlS/vs7vvjWahBYpHh/K1PvRAwLdIwsHNicdJbhdcLqLzuAB9mxxWSc4iW2zfY0
         75swc07bqitzHtQVSnpMOXHY2DyLHSE5/D6z1F0n8HmjX3DX8SEmHWSxnd4LdQOATZG7
         101jQTZAOfGhjB9aDnAl2mtEX480ups55W5oDzJ5wzFu0DVKjVbaNt4T+AVu0adZjd7B
         kdvVdboH/Cg0it2eBtU4Ta8OBZIySycsiIMISjGtVJqGBOeqsEZKz40hoXFqrbIqy5eM
         Wcyg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id 82si13370627pft.35.2019.04.03.02.21.54
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Apr 2019 02:21:54 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D740F6E97F;
	Wed,  3 Apr 2019 09:21:53 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82F426E97F
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed,  3 Apr 2019 09:21:52 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Apr 2019 02:21:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,304,1549958400"; 
 d="asc'?scan'208";a="157794208"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.13.116])
 by fmsmga002.fm.intel.com with ESMTP; 03 Apr 2019 02:21:51 -0700
Date: Wed, 3 Apr 2019 17:10:48 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: "Yuan, Hang" <hang.yuan@intel.com>
Subject: Re: [PATCH v5] drm/i915/gvt: addressed guest GPU hang with HWS index
 mode
Message-ID: <20190403091048.GM2322@zhen-hp.sh.intel.com>
References: <20190403080728.8140-1-xiaolin.zhang@intel.com>
 <C294FBAE55175941838A8D362DCD8AA225ECCEEC@SHSMSX104.ccr.corp.intel.com>
MIME-Version: 1.0
In-Reply-To: <C294FBAE55175941838A8D362DCD8AA225ECCEEC@SHSMSX104.ccr.corp.intel.com>
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
 <intel-gvt-dev@lists.freedesktop.org>, "Zhang,
 Xiaolin" <xiaolin.zhang@intel.com>
Content-Type: multipart/mixed; boundary="===============0610631609=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============0610631609==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="eMP3JyRexyk9c0Bv"
Content-Disposition: inline


--eMP3JyRexyk9c0Bv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2019.04.03 09:18:17 +0000, Yuan, Hang wrote:
> > -----Original Message-----
> > From: intel-gvt-dev [mailto:intel-gvt-dev-bounces@lists.freedesktop.org=
] On
> > Behalf Of Xiaolin Zhang
> > Sent: Wednesday, April 3, 2019 4:07 PM
> > To: intel-gvt-dev@lists.freedesktop.org
> > Cc: Zhang, Xiaolin <xiaolin.zhang@intel.com>; zhenyuw@linux.intel.com
> > Subject: [PATCH v5] drm/i915/gvt: addressed guest GPU hang with HWS
> > index mode
> >=20
> > with the introduce of "switch to use HWS indices rather than address", =
guest
> > GPU hang observed when running workloads which will update the seqno to
> > the real HW HWSP, not vitural GPU HWSP and then cause GPU hang.
> >=20
> > this patch is to revoke index mode in PIPE_CTRL and MI_FLUSH_DW and
> > patch guest GPU HWSP address value to these commands.
> >=20
> > Fixes: 54939ea0b("drm/i915: Switch to use HWS indices rather than
> > addresses")
> >=20
> > v5: refine code logic to handle index_mode.
> > v4: call cmd_address_audit for new address converted from index.
> > v3: handle index mode to gma conversion within cmd handler itself.
> > v2: PIPE_CTRL and MI_FLUSH_DW has different address offset, offset is a=
lso
> > passed for gma address update. <zhenyu>
> >=20
> > Signed-off-by: Xiaolin Zhang <xiaolin.zhang@intel.com>
> > ---
> >  drivers/gpu/drm/i915/gvt/cmd_parser.c | 22 ++++++++++++++++++++++
> >  1 file changed, 22 insertions(+)
> >=20
> > diff --git a/drivers/gpu/drm/i915/gvt/cmd_parser.c
> > b/drivers/gpu/drm/i915/gvt/cmd_parser.c
> > index b420919279c7..083ba64c8f5d 100644
> > --- a/drivers/gpu/drm/i915/gvt/cmd_parser.c
> > +++ b/drivers/gpu/drm/i915/gvt/cmd_parser.c
> > @@ -1077,6 +1077,8 @@ static int cmd_handler_pipe_control(struct
> > parser_exec_state *s)
> >  	bool index_mode =3D false;
> >  	unsigned int post_sync;
> >  	int ret =3D 0;
> > +	u32 hws_gpa;
> > +	u32 val;
> >=20
> >  	post_sync =3D (cmd_val(s, 1) &
> > PIPE_CONTROL_POST_SYNC_OP_MASK) >> 14;
> >=20
> > @@ -1100,6 +1102,15 @@ static int cmd_handler_pipe_control(struct
> > parser_exec_state *s)
> >  					index_mode =3D true;
> >  				ret |=3D cmd_address_audit(s, gma, sizeof(u64),
> >  						index_mode);
> > +				if (ret)
> > +					return ret;
> > +				if (index_mode) {
> > +					hws_gpa =3D s->vgpu->hws_pga[s-
> > >ring_id];
> [Yuan, Hang] From spec, index may be in global HW status page or  per-pro=
cess HW status page depending on destination address type. Still not clear =
if we can assume the index is alwary in global HW status page or at least p=
rint any warning on detecting per-process HW status page case?

These two checks are both for GGTT case.

> > +					gma =3D hws_gpa + gma;
> > +					patch_value(s, cmd_ptr(s, 2), gma);
> > +					val =3D cmd_val(s, 1) & (~(1 << 21));
> > +					patch_value(s, cmd_ptr(s, 1), val);
> > +				}
> >  			}
> >  		}
> >  	}
> > @@ -1598,6 +1609,8 @@ static int cmd_handler_mi_flush_dw(struct
> > parser_exec_state *s)
> >  	unsigned long gma;
> >  	bool index_mode =3D false;
> >  	int ret =3D 0;
> > +	u32 hws_gpa;
> > +	u32 val;
> >=20
> >  	/* Check post-sync and ppgtt bit */
> >  	if (((cmd_val(s, 0) >> 14) & 0x3) && (cmd_val(s, 1) & (1 << 2))) { @@=
 -
> > 1608,6 +1621,15 @@ static int cmd_handler_mi_flush_dw(struct
> > parser_exec_state *s)
> >  		if (cmd_val(s, 0) & (1 << 21))
> >  			index_mode =3D true;
> >  		ret =3D cmd_address_audit(s, gma, sizeof(u64), index_mode);
> > +		if (ret)
> > +			return ret;
> > +		if (index_mode) {
> > +			hws_gpa =3D s->vgpu->hws_pga[s->ring_id];
> > +			gma =3D hws_gpa + gma;
> > +			patch_value(s, cmd_ptr(s, 1), gma);
> > +			val =3D cmd_val(s, 0) & (~(1 << 21));
> > +			patch_value(s, cmd_ptr(s, 0), val);
> > +		}
> >  	}
> >  	/* Check notify bit */
> >  	if ((cmd_val(s, 0) & (1 << 8)))
> > --
> > 2.15.1
> >=20
> > _______________________________________________
> > intel-gvt-dev mailing list
> > intel-gvt-dev@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--eMP3JyRexyk9c0Bv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXKR4mAAKCRCxBBozTXgY
J/rRAKCB6SkYi3vi7rP+UhvdZaUkbdPC9QCgifYvl10+FMOHMFlVkPb/7thMtm4=
=D/dG
-----END PGP SIGNATURE-----

--eMP3JyRexyk9c0Bv--

--===============0610631609==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2

--===============0610631609==--
