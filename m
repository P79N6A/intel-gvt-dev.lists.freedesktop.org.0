Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a0d:d7d3:0:0:0:0:0 with SMTP id z202csp476063ywd;
        Wed, 30 Jan 2019 19:31:01 -0800 (PST)
X-Google-Smtp-Source: ALg8bN4olEn4AREHwTeG1Kgmic8B3UYFjMvKwpaFiXdC6qAa3KdcOltsL5/JFaVOLc4DYMuE1wNw
X-Received: by 2002:a17:902:4025:: with SMTP id b34mr33530062pld.181.1548905461319;
        Wed, 30 Jan 2019 19:31:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548905461; cv=none;
        d=google.com; s=arc-20160816;
        b=O0wdgXgnhN7laD8KDkz/Xl3TrIPE+kiZcFab74ldVvNK3SaUstMpKXxSm7teCzpGXl
         wzhcj8e94DUKHhtG7CaDKHqOjJJranghDkVZ1Ut/DhT5u1urtaJwPcR0KXCjZJFok17z
         ADpHVc/629V4pBHNg/2JinJGzggjSmxtaeWV2cDfLamjmIvMhBHp93taMh32d3dPtSkf
         9oka1ArDRMWQyDZxz5RsonSXHraZeyNTs2XZT4kfH4moa7ZDJ0n2LTNvm6P/0/m7JSSi
         VjFRMlCBMnpLdvR0IUFRvx7I+DsP3GkPA2nsl/GLfYnlqsIDzKKcpo3rm/8lYgObXznb
         U1jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:mime-version:references:message-id:subject:to:from:date
         :delivered-to;
        bh=7Jr6yJd2mIkrrMPpJVozuX+CfYflXkCQ4CCgVQWvMio=;
        b=MSb9QbRJld9Qj5Xo2REcphhaj2EwbYjYufiqXEJ60Vx441wPtQeeXuDCXTsBw6cwrG
         VrcCoKzPMD7XYXl/u09KK6SRWE0baIHMVentxWl3lufSsvXqQOHRRjWZKAZK88cZmNCa
         kmsWDLvgt5upP9QWUNLkjwspIOQoPp1Jhwm3VeHS9oZFlSlcABfPKCrCUWOzHHynH7BF
         DbiT0mPnN61MrfX7TIDIMDP7NZZDWnuHb6fa8EyHQ0Rs15mJukF5yiyEFtFcqU6MS3yd
         1j+4dnIV78nglN3umCY84y6mVjvdRlIkcYd20t/jl5ApIImrbfuFwwZitaL9H1OofBBB
         J/Iw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id a11si3238034pga.198.2019.01.30.19.31.00
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 30 Jan 2019 19:31:01 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 444546E0E7;
	Thu, 31 Jan 2019 03:31:00 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78F2B6E0E7
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 31 Jan 2019 03:30:57 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 30 Jan 2019 19:30:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,543,1539673200"; 
 d="asc'?scan'208";a="111218556"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.13.116])
 by orsmga007.jf.intel.com with ESMTP; 30 Jan 2019 19:30:56 -0800
Date: Thu, 31 Jan 2019 11:22:05 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: hang.yuan@linux.intel.com
Subject: Re: [PATCH v3 0/3] drm/i915/gvt: add VFIO graphics EDID region
Message-ID: <20190131032205.GG7203@zhen-hp.sh.intel.com>
References: <1548843954-4622-1-git-send-email-hang.yuan@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <1548843954-4622-1-git-send-email-hang.yuan@linux.intel.com>
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
Content-Type: multipart/mixed; boundary="===============2060856847=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============2060856847==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="1ar0NSVY9gjTGNA2"
Content-Disposition: inline


--1ar0NSVY9gjTGNA2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2019.01.30 18:25:51 +0800, hang.yuan@linux.intel.com wrote:
> From: Hang Yuan <hang.yuan@linux.intel.com>
>=20
> Create one VFIO graphics EDID region for vgpu. When the region is updated,
> hotplug event is emulated for guest to get new EDID data.
>=20
> v3: refine codes
> v2: add EDID blob sanity check and support EDID size update <zhenyu>
>=20
> Hang Yuan (3):
>   drm/i915/gvt: add functions to get default resolution
>   drm/i915/gvt: add hotplug emulation
>   drm/i915/gvt: add VFIO EDID region
>=20
>  drivers/gpu/drm/i915/gvt/display.c   |  31 ++++++++
>  drivers/gpu/drm/i915/gvt/display.h   |  37 +++++++--
>  drivers/gpu/drm/i915/gvt/gvt.c       |   1 +
>  drivers/gpu/drm/i915/gvt/gvt.h       |   3 +
>  drivers/gpu/drm/i915/gvt/hypercall.h |   1 +
>  drivers/gpu/drm/i915/gvt/kvmgt.c     | 143 +++++++++++++++++++++++++++++=
++++++
>  drivers/gpu/drm/i915/gvt/mpt.h       |  17 +++++
>  drivers/gpu/drm/i915/gvt/vgpu.c      |   6 ++
>  8 files changed, 233 insertions(+), 6 deletions(-)
>=20

Applied this, thanks!

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--1ar0NSVY9gjTGNA2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXFJp3QAKCRCxBBozTXgY
J11kAJsFF+fH+ort4bJWbEN1eRpCpD/bbgCfQgk3hk9tjMZkmy+reNRm/r6GoXA=
=Bh+L
-----END PGP SIGNATURE-----

--1ar0NSVY9gjTGNA2--

--===============2060856847==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2
Cg==

--===============2060856847==--
