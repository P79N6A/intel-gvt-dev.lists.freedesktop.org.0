Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:ed4:0:0:0:0:0 with SMTP id 203csp3555727ywo;
        Tue, 16 Apr 2019 01:59:50 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyT1u3wImZNQICdE4+AvoclSbfHqoIQI4onhFMGQflg4lZGs5PEaUYSOzMIzZOsLEHsE/D1
X-Received: by 2002:a63:2ace:: with SMTP id q197mr72210371pgq.371.1555405190594;
        Tue, 16 Apr 2019 01:59:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555405190; cv=none;
        d=google.com; s=arc-20160816;
        b=S0LoTJQMLM8jEaxn4jjteanYDakOLdSqtanWjErCRy9Mihea0P39JsLItjy3k53FF2
         VP5yn0R2d5Vg3VCc/Jj0XQirHqEf+ShY/TcDD0u2RDxjT08RGLkGVGQknHGE9bJUxSel
         DBrgZRL67KyV+o1Nk3D62YB5NzCcyjZB3+3yU4gaJZ7fboc7WEmpUY00QfFQF3vF4fs4
         42AQ012D7fB0nt4D1Y90QU35UcThQ/fUUUn/L9BoYq5GtssUpx1ttlEcew/BcJ8mxyox
         l8XokJyyW7srMCKP4+0E6U51smU4dkBifuXtrGHAvx/j/qbFIb/H/8i9465f1KWd9v6f
         PxMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:mime-version:references:message-id:subject:to:from:date
         :delivered-to;
        bh=jBbTQsdnSUi9YH5WfRPYQ/axdQPTEfV+MNJm+YdYSsI=;
        b=iYyqOJSeeTGRWzNwM1EzUOkZLYKcFIeD8UESG8KLXjGe2hGG8IEZeHOmKm2sZnNBOv
         8eg58x3mpItpjErdMc2bj2rWisUNdtNIEdlcVkY3ALwMDFu+n9bWZLM6Dsez5vzwUPIz
         YxqPDxeaXFfcuEe3Hrwui/iAQvO+es9+WFFP6/ESvvIUE08PeewTdeQpFiQbtqrDMgUi
         hr4u/FIox5JwD8Z13BHudOxTQv23bKVO0+cCprLYJrmjpvrYtXaIQWVKB5Pd/61Nx9sb
         6ZxwZltgAWEk95XfeNFgx0RrKvPUCpne85AuEx9vrFK1GiFaUPmdey1EK6PxTXspqkyX
         CCFw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id f35si41606101pgl.369.2019.04.16.01.59.50
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Apr 2019 01:59:50 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF72F89A4B;
	Tue, 16 Apr 2019 08:59:49 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A4D789A4B;
 Tue, 16 Apr 2019 08:59:48 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 16 Apr 2019 01:59:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,357,1549958400"; 
 d="asc'?scan'208";a="161996525"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.13.116])
 by fmsmga002.fm.intel.com with ESMTP; 16 Apr 2019 01:59:46 -0700
Date: Tue, 16 Apr 2019 16:48:14 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: Re: [PULL] gvt-next
Message-ID: <20190416084814.GH17995@zhen-hp.sh.intel.com>
References: <20190409040500.GM17995@zhen-hp.sh.intel.com>
 <155539974336.31447.265673967377405617@jlahtine-desk.ger.corp.intel.com>
MIME-Version: 1.0
In-Reply-To: <155539974336.31447.265673967377405617@jlahtine-desk.ger.corp.intel.com>
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
Cc: Jani Nikula <jani.nikula@intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, "Yuan, Hang" <hang.yuan@intel.com>, "Lv,
 Zhiyuan" <zhiyuan.lv@intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 intel-gvt-dev <intel-gvt-dev@lists.freedesktop.org>,
 Zhi Wang <zhi.a.wang@intel.com>
Content-Type: multipart/mixed; boundary="===============1909747495=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============1909747495==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="my6/OtttYtn8dhky"
Content-Disposition: inline


--my6/OtttYtn8dhky
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2019.04.16 10:29:03 +0300, Joonas Lahtinen wrote:
> I'm getting an error while pulling this, could you check it:
>=20
>   From https://github.com/intel/gvt-linux
>    * tag                         gvt-next-2019-04-09 -> FETCH_HEAD
>   dim: 66bd9f69d615 ("drm/i915/gvt: addressed guest GPU hang with HWS ind=
ex mode"): Fixes: SHA1 in not pointing at an ancestor:
>   dim:     54939ea0bd85 ("drm/i915: Switch to use HWS indices rather than=
 addresses")
>   dim: ERROR: issues in commits detected, aborting
>=20

Sorry for this, I applied gvt change earlier than back-merge one, which cau=
sed this.
Now generated new one, pls help to pull.

Thanks.
--
The following changes since commit 28d618e9ab86f26a31af0b235ced55beb3e343c8:

  drm/i915: Update DRIVER_DATE to 20190404 (2019-04-04 17:43:58 +0300)

are available in the Git repository at:

  https://github.com/intel/gvt-linux.git tags/gvt-next-2019-04-16

for you to fetch changes up to 2bfc4975083ace0e5777116514c3a75e59b3dbcd:

  drm/i915/gvt: Fix incorrect mask of mmio 0x22028 in gen8/9 mmio list (201=
9-04-16 16:52:51 +0800)

----------------------------------------------------------------
gvt-next-2019-04-16

- Refine range of MCHBAR snapshot (Yakui)
- Refine out-of-sync page struct (Yakui)
- Remove unused vGPU sreg (Yan)
- Refind MMIO reg names (Xiaolin)
- Proper handling of sync/async flip (Colin)
- Proper handling of PIPE_CONTROL/MI_FLUSH_DW index mode (Xiaolin)
- EXCC reg mask fix (Colin)

----------------------------------------------------------------
Colin Xu (5):
      drm/i915/gvt: Use consist max display pipe numbers as i915 definition
      drm/i915/gvt: Add macro define for mmio 0x50080 and gvt flip event
      drm/i915/gvt: Enable synchronous flip on handling MI_DISPLAY_FLIP
      drm/i915/gvt: Enable async flip on plane surface mmio writes
      drm/i915/gvt: Fix incorrect mask of mmio 0x22028 in gen8/9 mmio list

Xiaolin Zhang (2):
      drm/i915/gvt: replaced register address with name
      drm/i915/gvt: addressed guest GPU hang with HWS index mode

Yan Zhao (1):
      drm/i915/gvt: remove the unused sreg

Zhao Yakui (2):
      drm/i915/gvt: Refine the snapshort range of I915 MCHBAR to optimize g=
vt-g boot time
      drm/i915/gvt: Refine the combined intel_vgpu_oos_page struct to save =
memory

Zhenyu Wang (1):
      Merge tag 'drm-intel-next-2019-04-04' into gvt-next

 drivers/gpu/drm/i915/gvt/cmd_parser.c   |  30 +++++-
 drivers/gpu/drm/i915/gvt/display.c      |   1 -
 drivers/gpu/drm/i915/gvt/gtt.c          |   7 ++
 drivers/gpu/drm/i915/gvt/gtt.h          |   2 +-
 drivers/gpu/drm/i915/gvt/gvt.h          |   9 +-
 drivers/gpu/drm/i915/gvt/handlers.c     | 159 +++++++++++++++++++---------=
----
 drivers/gpu/drm/i915/gvt/mmio.c         |   8 +-
 drivers/gpu/drm/i915/gvt/mmio_context.c |   4 +-
 drivers/gpu/drm/i915/gvt/reg.h          |  34 +++++++
 9 files changed, 172 insertions(+), 82 deletions(-)


--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--my6/OtttYtn8dhky
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXLWWzgAKCRCxBBozTXgY
J535AJ49THsH7RARQAEV0ZzMlY9UBvoHYwCgnAshtxehwoxsgq0DLYetN9Xwy0M=
=9254
-----END PGP SIGNATURE-----

--my6/OtttYtn8dhky--

--===============1909747495==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2

--===============1909747495==--
