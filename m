Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a0d:d7d3:0:0:0:0:0 with SMTP id z202csp743108ywd;
        Thu, 31 Jan 2019 01:44:02 -0800 (PST)
X-Google-Smtp-Source: ALg8bN6VHpnbFD2RytVP/SCGMluxHuzr88tFMZHkIKx99zKgpseo1NGoGlcqmmt5jCVztjHh0nbx
X-Received: by 2002:a63:2263:: with SMTP id t35mr30805441pgm.69.1548927842557;
        Thu, 31 Jan 2019 01:44:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548927842; cv=none;
        d=google.com; s=arc-20160816;
        b=y4Ahc4IC/dCIWoo/MPaXksSdzI/cDPbFS4+afedH17n9/Lz+0mSXYCKwlOTy7iBR1c
         yVNcvXm2Zpe6SKfdHP0RfdQvYRPcFO+f2BEQfpHegfoIhB+CKJgD1X+bw9yNnDZGVIpc
         Xzwm7uTb4kbME9zlsRZ3AA+boty4dWhRD7jLavyXFVGg7T1muLM19GPUaUCSUrb/zyOb
         XrKcWn4EtJnmYw5vrEeScwMuoQgeEJ+x1ZaRLn3WBba5Nx1JZZzRbulki2gK06NnW2al
         +TO2mkg+IjKl2jLR1bAJKbavjA4v3CLiV1DpEJQHCl8BeFvClGE2kW7g6DSD/HtRBB6n
         UJIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:cc:list-subscribe
         :list-help:list-post:list-archive:list-unsubscribe:list-id
         :precedence:mime-version:message-id:date:references:organization
         :in-reply-to:subject:to:from:delivered-to;
        bh=wHgpRi2pSW0m1vIiv6aTINNdpfYGUKA56oz6NO50+go=;
        b=w/UPVDgeMQdzwbhSsoq2WUjCWKzqfgWx5kl/B4uoHnFgtI8uR/0Kl1XFvbLCwNlVL6
         CL2eGccge/xxoWpSv72QkSjc+OFFRSmGV+KMpDeQAgIhz8xqFb+PmF1AubUO+VHtKRXH
         g52uOdZIdO4IjstMfPPAOoB2/CVI2EhBq2RkSVzqEciQBmcwNkrpiZesLp1yyVccs31i
         yJbixxKvTwgXxHsUAqJYbjlIgxNChCu32MiwUO764ZOKJ4Y+MMEn4M/idJ6GBqVuuzWA
         7rQlvOfaul7J//0l3DKkni+w7v697IcoL4bjjl8Plfa/Quw+3hN/lAHrKzVNtL/iMfxM
         vY5A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id f124si4114517pfa.1.2019.01.31.01.44.01
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 31 Jan 2019 01:44:02 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1F786EC5D;
	Thu, 31 Jan 2019 09:44:01 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E34D46EC5B;
 Thu, 31 Jan 2019 09:43:59 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 31 Jan 2019 01:43:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,543,1539673200"; d="scan'208";a="143009736"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.172])
 by fmsmga001.fm.intel.com with ESMTP; 31 Jan 2019 01:43:56 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>, "Vivi\,
 Rodrigo" <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: Re: [PULL] gvt-fixes
In-Reply-To: <20190124054801.GP7203@zhen-hp.sh.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20190124054801.GP7203@zhen-hp.sh.intel.com>
Date: Thu, 31 Jan 2019 11:45:33 +0200
Message-ID: <87ftt9yxc2.fsf@intel.com>
MIME-Version: 1.0
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 intel-gvt-dev <intel-gvt-dev@lists.freedesktop.org>, "Lv,
 Zhiyuan" <zhiyuan.lv@intel.com>, Zhi Wang <zhi.a.wang@intel.com>, "Yuan,
 Hang" <hang.yuan@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

T24gVGh1LCAyNCBKYW4gMjAxOSwgWmhlbnl1IFdhbmcgPHpoZW55dXdAbGludXguaW50ZWwuY29t
PiB3cm90ZToKPiBIaSwKPgo+IEhlcmUncyBvbmUgZml4IGZvciBndnQgdG8gZGVzdHJveSBzaGFk
b3cgYmF0Y2ggYW5kIGluZGlyZWN0IGNvbnRleHQKPiBwcm9wZXJseS4KCkkgc2VlbSB0byBoYXZl
IGZhaWxlZCB0byBsZXQgeW91IGtub3cgdGhhdCBJJ3ZlIHB1bGxlZCB0aGlzLgoKVGhhbmtzLApK
YW5pLgoKCgo+Cj4gVGhhbmtzLgo+IC0tCj4gVGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNv
bW1pdCA1MWIwMGQ4NTA5ZGM2OWM5ODc0MGRhMmFkMDczMDhiNjMwZDNlYjdkOgo+Cj4gICBkcm0v
aTkxNS9ndnQ6IEZpeCBtbWFwIHJhbmdlIGNoZWNrICgyMDE5LTAxLTE1IDE5OjA0OjQ1ICswODAw
KQo+Cj4gYXJlIGF2YWlsYWJsZSBpbiB0aGUgR2l0IHJlcG9zaXRvcnkgYXQ6Cj4KPiAgIGh0dHBz
Oi8vZ2l0aHViLmNvbS9pbnRlbC9ndnQtbGludXguZ2l0IHRhZ3MvZ3Z0LWZpeGVzLTIwMTktMDEt
MjQKPgo+IGZvciB5b3UgdG8gZmV0Y2ggY2hhbmdlcyB1cCB0byAwZjc1NTUxMjE2MDkxMjIzZWZl
MWYxODI5NWY2NTVhZmY2NDE1Mzg1Ogo+Cj4gICBkcm0vaTkxNS9ndnQ6IHJlbGVhc2Ugc2hhZG93
IGJhdGNoIGJ1ZmZlciBhbmQgd2FfY3R4IGJlZm9yZSBkZXN0cm95IG9uZSB3b3JrbG9hZCAoMjAx
OS0wMS0yMyAxMzo1ODo0NiArMDgwMCkKPgo+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiBndnQtZml4ZXMtMjAxOS0wMS0y
NAo+Cj4gLSBGaXggZGVzdHJveSBvZiBzaGFkb3cgYmF0Y2ggYW5kIGluZGlyZWN0IGN0eCAoV2Vp
bmFuKQo+Cj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLQo+IFdlaW5hbiBMaSAoMSk6Cj4gICAgICAgZHJtL2k5MTUvZ3Z0OiBy
ZWxlYXNlIHNoYWRvdyBiYXRjaCBidWZmZXIgYW5kIHdhX2N0eCBiZWZvcmUgZGVzdHJveSBvbmUg
d29ya2xvYWQKPgo+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvc2NoZWR1bGVyLmMgfCAxMSAr
KysrKystLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9u
cygtKQoKLS0gCkphbmkgTmlrdWxhLCBJbnRlbCBPcGVuIFNvdXJjZSBHcmFwaGljcyBDZW50ZXIK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2
Cg==
