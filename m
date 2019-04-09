Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:ed4:0:0:0:0:0 with SMTP id 203csp4130766ywo;
        Mon, 8 Apr 2019 21:16:19 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzaDpRQcrBDd/SzoUZWSfZMQqdE0XtRtJXJ6LrxN/xNfTWXgvShFUJNTQFN6ayZtvKLWISk
X-Received: by 2002:a17:902:e091:: with SMTP id cb17mr35202064plb.222.1554783379753;
        Mon, 08 Apr 2019 21:16:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1554783379; cv=none;
        d=google.com; s=arc-20160816;
        b=HABzNU1eVLxSHCbpB9yiMCS9q/wHnXfYiBJJfpgpO/cEqooXcqC/BO4B6DjQLw4Rt3
         6uhwpzbo55fDzFtALJq63w7iW1eAbnQIqcQyXiLaGsdbllhtVXfYV8K32bbrTF3WmD3T
         r1YXd7xR2v1vpeuBW3dIrNMZXt1b2y/7ItlJffBE97LxI1VKT3HJrGqEwN29/GCM/KhQ
         sewkVRzE4BPuj3yHN7t3qq50PrEN65XnEiv+oNdCnla9cBfEOx/bSLKWZKSmeYgvpTe8
         //phA1l4wezBTN4JPC3sT4uOIlIcpIVAQJV+E4NE/2RtmWuKPZzDMsFqMPyMIfZaZgCb
         /d2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :mime-version:message-id:subject:to:from:date:delivered-to;
        bh=+0vDmY04VqCNNH3v7nlUxl5lEAuz00y6aKnDQQFIhRM=;
        b=OzrSdlcQIR3J1XdFLfK3Ca2nOdR46BvRLrhvZ3KHhdFqOMPlNLW5Mxihil6TsjEsKY
         3Pc0z2F5csnmslvC7LiKyIO9GX81NBhyY0Pgq4XS4F53sCaTvbXXuaLh90enesJp/HZ4
         wEWQfEuOxZkDIMAn0ZrSHQrSPaaRWAaj8pNz4xVGw/uEJPQO9VEoR839uDRbTpMhj+vD
         nl9giAo1GSMOX7MXBDGmkJ9QeJbbYuyoR1/QfwvXosoS52BKhrFliEfKoK6fYhgWGoYL
         AgULrlKLPsg+UAStTrbUADxpnk+2zU9ggRCHHYgdpNbBOEqXHMp/7epIj5Uei5fA+D6o
         s/2w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id 129si30924346pfz.159.2019.04.08.21.16.18
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 Apr 2019 21:16:19 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3B8B8912F;
	Tue,  9 Apr 2019 04:16:18 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D97B8912F;
 Tue,  9 Apr 2019 04:16:18 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 Apr 2019 21:16:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,328,1549958400"; 
 d="asc'?scan'208";a="314276577"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.13.116])
 by orsmga005.jf.intel.com with ESMTP; 08 Apr 2019 21:16:15 -0700
Date: Tue, 9 Apr 2019 12:05:00 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 Jani Nikula <jani.nikula@intel.com>
Subject: [PULL] gvt-next
Message-ID: <20190409040500.GM17995@zhen-hp.sh.intel.com>
MIME-Version: 1.0
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 intel-gvt-dev <intel-gvt-dev@lists.freedesktop.org>, "Lv,
 Zhiyuan" <zhiyuan.lv@intel.com>, Zhi Wang <zhi.a.wang@intel.com>, "Yuan,
 Hang" <hang.yuan@intel.com>
Content-Type: multipart/mixed; boundary="===============0110370035=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============0110370035==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="NqSa+Xr3J/G6Hhls"
Content-Disposition: inline


--NqSa+Xr3J/G6Hhls
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


Hi,

This includes various code refinement and cleanups, with proper
async/sync display flip handling, and also some changes required
for recent drm-intel-next as guest kernel, details below.

Thanks
--
The following changes since commit a01b2c6f47d86c7d1a9fa822b3b91ec233b61784:

  drm/i915: Update DRIVER_DATE to 20190328 (2019-03-28 14:41:55 +0200)

are available in the Git repository at:

  https://github.com/intel/gvt-linux.git tags/gvt-next-2019-04-09

for you to fetch changes up to 201e3e8580bb4924d0cc29fc3841ea5782401b46:

  drm/i915/gvt: Fix incorrect mask of mmio 0x22028 in gen8/9 mmio list (201=
9-04-03 16:37:20 +0800)

----------------------------------------------------------------
gvt-next-2019-04-09

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
      Merge tag 'drm-intel-next-2019-03-28' into gvt-next

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

--NqSa+Xr3J/G6Hhls
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXKwZ6wAKCRCxBBozTXgY
J5kYAKCK9l+/xI5yJV9oWRAefrABRMTSiACeNtWE1rT/RCteDwKNR4wRkKopLhw=
=GfTU
-----END PGP SIGNATURE-----

--NqSa+Xr3J/G6Hhls--

--===============0110370035==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2

--===============0110370035==--
