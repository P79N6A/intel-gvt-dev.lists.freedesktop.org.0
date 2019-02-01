Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a0d:d7d3:0:0:0:0:0 with SMTP id z202csp543919ywd;
        Fri, 1 Feb 2019 09:05:14 -0800 (PST)
X-Google-Smtp-Source: ALg8bN7WMgEQzbftxK9+I83ZnvyRqXEy5hIuYXHhR/dtgFLl9ITlUmYmZFhdpznql16ULc8Q7BIY
X-Received: by 2002:a17:902:2868:: with SMTP id e95mr40451735plb.317.1549040708510;
        Fri, 01 Feb 2019 09:05:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549040708; cv=none;
        d=google.com; s=arc-20160816;
        b=YUhleEXUqMo0ValzYaPnWXuLpQxyM/kGmdTMvbCwrTYJPv6iRaxGp8g/S/nLt6QMhj
         uUV/xxuu4cCJ6LYZIO4HlyodGZKKQE4PMSOjvM5mDqA2avWdN9MaWEJBzl1wvYPuQr88
         Toi/IPZJFj3byIVbn5BcE4Am73AuQu1IRfCgXILBu0uDpnGlYrZcvWfhw2TkievdWbc9
         T5idnl78TTZZdExJqV9CZR6M0Got2qiP+e8jSdiKXsjyJjfn01c1q8pwrJfdUNsRzOrs
         xc7aoBVPVBzxZU9dmR8L+2ZuHLLB8acJdQ15KlfxSX9RTjrdE0IzHk89x+lxka8bhSyo
         TEZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:cc:list-subscribe
         :list-help:list-post:list-archive:list-unsubscribe:list-id
         :precedence:user-agent:in-reply-to:content-disposition:mime-version
         :references:message-id:subject:to:from:date:delivered-to;
        bh=yhvOBT4gJFepU36tKRkCgvFF8gLM02H5vEfYr3NJVGY=;
        b=i8UDADpKu7RLfVsopj2jUwJIWnQEGcp1CSEbF/uUeG7Xq4ZlsceOud3fycjKO/e1Ac
         jRABbv8QSGxdZAUcyWht7PIfPfenaSdK3fNeikkP7Bt1Zu4SzjAlTIpAscuLlDgKGEX9
         QURSwkPxJ86rL1b0z2JrDTbhU3GY3TQQ47xkB9wa2IFuUvk8IjIANWa3yZNFVrnP2Syc
         1DJEEKpFgw4h8vb/1Oz8rxwc+A8pkn/w6mFwotdXSTOWdqCM88i7I/Audw0p8i0x4cQQ
         4LgidLiDQOwRurMeXY68Ghjfbevy6ELom05PvgkRQ7CXyHf5E1BDoTHyqv428b8dGTVa
         B1pQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id z14si7434742pgz.180.2019.02.01.09.05.00
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 01 Feb 2019 09:05:08 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 732D46E2DE;
	Fri,  1 Feb 2019 17:05:00 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C46ED6E2CC;
 Fri,  1 Feb 2019 17:04:58 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 01 Feb 2019 09:04:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,549,1539673200"; d="scan'208";a="111672889"
Received: from rdvivi-losangeles.jf.intel.com (HELO intel.com) ([10.7.196.65])
 by orsmga007.jf.intel.com with ESMTP; 01 Feb 2019 09:04:57 -0800
Date: Fri, 1 Feb 2019 09:04:58 -0800
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: Re: [Intel-gfx] [PULL] gvt-next
Message-ID: <20190201170458.GA15784@intel.com>
References: <20190201061523.GE5588@zhen-hp.sh.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190201061523.GE5588@zhen-hp.sh.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Jani Nikula <jani.nikula@intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, "Yuan,
 Hang" <hang.yuan@intel.com>, "Lv, Zhiyuan" <zhiyuan.lv@intel.com>,
 intel-gvt-dev <intel-gvt-dev@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

T24gRnJpLCBGZWIgMDEsIDIwMTkgYXQgMDI6MTU6MjNQTSArMDgwMCwgWmhlbnl1IFdhbmcgd3Jv
dGU6Cj4gCj4gSGksCj4gCj4gVGhpcyBzaG91bGQgYmUgbGFzdCBndnQtbmV4dCBwdWxsIGZvciB0
aGlzIHJvdW5kLCB3aGljaCBhZGRzIFZGSU8gZWRpZAo+IHJlZ2lvbiBzdXBwb3J0IGluIEdWVCwg
Vk0gbWFuYWdlciBjYW4gdXNlIHRoaXMgdG8gc3BlY2lmeSBjdXN0b20gRURJRAo+IGZvciBWTSwg
d2hpY2ggY2FuIGJlIHVzZWQgZm9yIGUuZyBVSSByZXNpemUsIGV0Yy4KClB1bGxlZCwgdGhhbmtz
Cgo+IAo+IHAucywgTmV4dCB3ZWVrIHdpbGwgYmUgY2hpbmVzZSBuZXcgeWVhciwgc28gdGVhbSB3
aWxsIGJlIG9mZmxpbmUgdGhlbi4KCkhhcHB5IE5ldyBZZWFyIQoKPiAKPiBUaGFua3MuCj4gLS0K
PiBUaGUgZm9sbG93aW5nIGNoYW5nZXMgc2luY2UgY29tbWl0IDJlNjc5ZDQ4ZjM4YzM3ODY1MGRi
NDAzYjRiYTIyNDhhZGYwNjkxYjI6Cj4gCj4gICBkcm0vaTkxNS9ndnQ6IHN3aXRjaCB0byBrZXJu
ZWwgdHlwZXMgKDIwMTktMDEtMjMgMTM6NTY6MTQgKzA4MDApCj4gCj4gYXJlIGF2YWlsYWJsZSBp
biB0aGUgR2l0IHJlcG9zaXRvcnkgYXQ6Cj4gCj4gICBodHRwczovL2dpdGh1Yi5jb20vaW50ZWwv
Z3Z0LWxpbnV4LmdpdCB0YWdzL2d2dC1uZXh0LTIwMTktMDItMDEKPiAKPiBmb3IgeW91IHRvIGZl
dGNoIGNoYW5nZXMgdXAgdG8gMzljNjhlODdiYzUwYTcxYmNmZTkzNTgyZDliMDY3M2VmMzBkYjQx
ODoKPiAKPiAgIGRybS9pOTE1L2d2dDogYWRkIFZGSU8gRURJRCByZWdpb24gKDIwMTktMDEtMzEg
MTE6NDE6MjUgKzA4MDApCj4gCj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+IGd2dC1uZXh0LTIwMTktMDItMDEKPiAKPiAt
IG5ldyBWRklPIEVESUQgcmVnaW9uIHN1cHBvcnQgKEhlbnJ5KQo+IAo+IC0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiBIYW5n
IFl1YW4gKDMpOgo+ICAgICAgIGRybS9pOTE1L2d2dDogYWRkIGZ1bmN0aW9ucyB0byBnZXQgZGVm
YXVsdCByZXNvbHV0aW9uCj4gICAgICAgZHJtL2k5MTUvZ3Z0OiBhZGQgaG90cGx1ZyBlbXVsYXRp
b24KPiAgICAgICBkcm0vaTkxNS9ndnQ6IGFkZCBWRklPIEVESUQgcmVnaW9uCj4gCj4gIGRyaXZl
cnMvZ3B1L2RybS9pOTE1L2d2dC9kaXNwbGF5LmMgICB8ICAzMSArKysrKysrKwo+ICBkcml2ZXJz
L2dwdS9kcm0vaTkxNS9ndnQvZGlzcGxheS5oICAgfCAgMzcgKysrKysrKy0tCj4gIGRyaXZlcnMv
Z3B1L2RybS9pOTE1L2d2dC9ndnQuYyAgICAgICB8ICAgMSArCj4gIGRyaXZlcnMvZ3B1L2RybS9p
OTE1L2d2dC9ndnQuaCAgICAgICB8ICAgMyArCj4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9o
eXBlcmNhbGwuaCB8ICAgMSArCj4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9rdm1ndC5jICAg
ICB8IDE0MyArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ICBkcml2ZXJzL2dw
dS9kcm0vaTkxNS9ndnQvbXB0LmggICAgICAgfCAgMTcgKysrKysKPiAgZHJpdmVycy9ncHUvZHJt
L2k5MTUvZ3Z0L3ZncHUuYyAgICAgIHwgICA2ICsrCj4gIDggZmlsZXMgY2hhbmdlZCwgMjMzIGlu
c2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCj4gCj4gCj4gLS0gCj4gT3BlbiBTb3VyY2UgVGVj
aG5vbG9neSBDZW50ZXIsIEludGVsIGx0ZC4KPiAKPiAkZ3BnIC0ta2V5c2VydmVyIHd3d2tleXMu
cGdwLm5ldCAtLXJlY3Yta2V5cyA0RDc4MTgyNwoKCgo+IF9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCj4gSW50ZWwtZ2Z4IG1haWxpbmcgbGlzdAo+IEludGVs
LWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWdmeAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0
LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2Cg==
