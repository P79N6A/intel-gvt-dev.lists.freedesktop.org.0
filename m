Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:ed4:0:0:0:0:0 with SMTP id 203csp807566ywo;
        Wed, 3 Apr 2019 17:12:27 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyKn5mj/RozrbAEY6nb3WMIPhmkWapHqLM/IZAZ7FLm0CA0Wc3xBc4pKSVZuPOJaW4TiGk/
X-Received: by 2002:a17:902:6b03:: with SMTP id o3mr3076467plk.226.1554336747484;
        Wed, 03 Apr 2019 17:12:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1554336747; cv=none;
        d=google.com; s=arc-20160816;
        b=LkbGRlxPPRS6RjrAYzIdoRxjdebceC+qGvbfy5iD1ISpbe7Pjd5NPbS6bX9/uO7O3X
         VxNkU7mQgo3tJgWFASkkD42CKNBIK3uURqNtYqBkJ/w5jvG1JcK2ez6ry5fB6wPuBiql
         chV+rF2SFlxuuDqFG6WoEAGjyOCoVDZAJ2cCOYHE1wEOBjdlPDXszMI9vyXrmz/XX/ot
         PfZ/f0HIh2yc0SlmXIwS27BE1CeC8oZx/bKaTfu4ICLh3XW1958w+GaObPBu04q3Fu1i
         0FMhOs4MOUzwh8d0s5xwuEUxOQbypE/opsRIdbIplfBVBRW3/iGlS8c57S2yl6hjy7rD
         lRGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:cc:list-subscribe
         :list-help:list-post:list-archive:list-unsubscribe:list-id
         :precedence:user-agent:in-reply-to:content-disposition:mime-version
         :references:message-id:subject:to:from:date:delivered-to;
        bh=/P6hB1PevKrCuGHEfq2hV2gtKc1sEiBu7Xac7Qpwh9o=;
        b=cH618WTT9Q7ILfIeFKBetvML1g4dZ0lWfXXiTTuF6SIP5w2WhNWg3SWHRZUP+P482c
         BotfvYYhIahf99F7TDMpCtXvRYleQ/FkK0zA0XFuGsCwh1fEcn02stT489tLacbHPaI8
         ml61DYxxNTvXJ+aOx9NgU5OfF/oxxSLu8ZwRykYfZZhwZrsGHcouUm1RqKH0nOxdqg9N
         0vOpTNY52YsfNw1fmnm7q8iKfGL9uzqe56gf1fxClaDLXR2fdkfd0XmSBC9gyBtFZ69T
         G5LDTR2h7shYWxU8O5UqN6A5Q8lgiPQNMNKcpfCTlFCCRXWlsVn33avbnPQ2oRJKTxyD
         nMjg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id t9si4462020pgp.273.2019.04.03.17.12.26
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Apr 2019 17:12:27 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 956B86E541;
	Thu,  4 Apr 2019 00:12:26 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D80C6E53F;
 Thu,  4 Apr 2019 00:12:25 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Apr 2019 17:12:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,306,1549958400"; d="scan'208";a="131274888"
Received: from rdvivi-losangeles.jf.intel.com (HELO intel.com) ([10.7.196.65])
 by orsmga008.jf.intel.com with ESMTP; 03 Apr 2019 17:12:24 -0700
Date: Wed, 3 Apr 2019 17:12:37 -0700
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: Re: [PULL] gvt-fixes
Message-ID: <20190404001237.GA18158@intel.com>
References: <20190402094037.GB2322@zhen-hp.sh.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190402094037.GB2322@zhen-hp.sh.intel.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
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
 intel-gvt-dev <intel-gvt-dev@lists.freedesktop.org>,
 Zhi Wang <zhi.a.wang@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

T24gVHVlLCBBcHIgMDIsIDIwMTkgYXQgMDU6NDA6MzdQTSArMDgwMCwgWmhlbnl1IFdhbmcgd3Jv
dGU6Cj4gCj4gSGksCj4gCj4gSGVyZSdzIGd2dC1maXhlcyBmb3IgNS4xLXJjNCB3aGljaCBpbmNs
dWRlcyBtaXNjIGZpeGVzIGZvcgo+IHZHUFUgZGlzcGxheSBwbGFuZSBzaXplIGNhbGN1bGF0aW9u
LCBzaGFkb3cgbW0gcGluIGNvdW50LAo+IGVycm9yIHJlY292ZXJ5IHBhdGggZm9yIHdvcmtsb2Fk
IGNyZWF0ZSBhbmQgb25lIGtlcm5lbGRvYwo+IGZpeCB3aGljaCBJIG1pc3NlZCB0byBpbmNsdWRl
IGJlZm9yZS4KCmRpbTogMDAwZDM4OTcwZTk4ICgiZHJtL2k5MTUvZ3Z0OiBDb3JyZWN0IHRoZSBj
YWxjdWxhdGlvbiBvZiBwbGFuZSBzaXplIik6IEZpeGVzOiBTSEExIG5lZWRzIGF0IGxlYXN0IDEy
IGRpZ2l0czoKZGltOiAgICAgZTU0NmUyODFkMzMoImRybS9pOTE1L2d2dDogRG1hYnVmIHN1cHBv
cnQgZm9yIEdWVC1nIikKZGltOiBFUlJPUjogaXNzdWVzIGluIGNvbW1pdHMgZGV0ZWN0ZWQsIGFi
b3J0aW5nCgpJcyBpdCBzb21ldGhpbmcgeW91IGNvdWxkIGZpeCBvbiB5b3VyIHNpZGUgd2l0aG91
dCBoYXZpbmcKdG8gYnktcGFzcyBkaW0gdGhpcyB0aW1lPwoKVGhhbmtzLApSb2RyaWdvLgoKPiAK
PiBUaGFua3MuCj4gLS0KPiBUaGUgZm9sbG93aW5nIGNoYW5nZXMgc2luY2UgY29tbWl0IDI2Y2Rh
YWM0NzkzYzQ5MzU3ZDJjNzMxZjIxOTA2MzJjZWZiN2VmYjE6Cj4gCj4gICBkcm0vaTkxNS9pY2w6
IEZpeCBWRUJPWCBtaXNtYXRjaCBCVUdfT04oKSAoMjAxOS0wMy0yOCAxNTozNjo0MCArMDIwMCkK
PiAKPiBhcmUgYXZhaWxhYmxlIGluIHRoZSBHaXQgcmVwb3NpdG9yeSBhdDoKPiAKPiAgIGh0dHBz
Oi8vZ2l0aHViLmNvbS9pbnRlbC9ndnQtbGludXguZ2l0IHRhZ3MvZ3Z0LWZpeGVzLTIwMTktMDQt
MDIKPiAKPiBmb3IgeW91IHRvIGZldGNoIGNoYW5nZXMgdXAgdG8gYTE0ZjA2ODU0NWNjMTNkYjll
MGFkMGVhNDUxZWM0MmU1YWJjOTdjMDoKPiAKPiAgIGRybS9pOTE1L2d2dDogRml4IGtlcm5lbGRv
YyB0eXBvIGZvciBpbnRlbF92Z3B1X2VtdWxhdGVfaG90cGx1ZyAoMjAxOS0wMy0yOSAxMDozMTox
NSArMDgwMCkKPiAKPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gZ3Z0LWZpeGVzLTIwMTktMDQtMDIKPiAKPiAtIEZpeCBz
aGFkb3cgbW0gcGluIGNvdW50IChZYW4pCj4gLSBGaXggY21kIHBhcnNlciBlcnJvciBwYXRoIHJl
Y292ZXIgKFlhbikKPiAtIEZpeCB2R1BVIGRpc3BsYXkgcGxhbmUgc2l6ZSBjYWxjdWxhdGlvbiAo
WGlvbmcpCj4gLSBGaXgga2VybmVsZG9jIChDaHJpcykKPiAKPiAtLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gQ2hyaXMgV2ls
c29uICgxKToKPiAgICAgICBkcm0vaTkxNS9ndnQ6IEZpeCBrZXJuZWxkb2MgdHlwbyBmb3IgaW50
ZWxfdmdwdV9lbXVsYXRlX2hvdHBsdWcKPiAKPiBYaW9uZyBaaGFuZyAoMSk6Cj4gICAgICAgZHJt
L2k5MTUvZ3Z0OiBDb3JyZWN0IHRoZSBjYWxjdWxhdGlvbiBvZiBwbGFuZSBzaXplCj4gCj4gWWFu
IFpoYW8gKDIpOgo+ICAgICAgIGRybS9pOTE1L2d2dDogZG8gbm90IGRlbGl2ZXIgYSB3b3JrbG9h
ZCBpZiBpdHMgY3JlYXRpb24gZmFpbHMKPiAgICAgICBkcm0vaTkxNS9ndnQ6IGRvIG5vdCBsZXQg
cGluIGNvdW50IG9mIHNoYWRvdyBtbSBnbyBuZWdhdGl2ZQo+IAo+ICBkcml2ZXJzL2dwdS9kcm0v
aTkxNS9ndnQvZGlzcGxheS5jICAgfCAyICstCj4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9k
bWFidWYuYyAgICB8IDggKystLS0tLS0KPiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2d0dC5j
ICAgICAgIHwgMiArLQo+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvc2NoZWR1bGVyLmMgfCA1
ICsrKy0tCj4gIDQgZmlsZXMgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCAxMCBkZWxldGlvbnMo
LSkKPiAKPiAKPiAtLSAKPiBPcGVuIFNvdXJjZSBUZWNobm9sb2d5IENlbnRlciwgSW50ZWwgbHRk
Lgo+IAo+ICRncGcgLS1rZXlzZXJ2ZXIgd3d3a2V5cy5wZ3AubmV0IC0tcmVjdi1rZXlzIDRENzgx
ODI3CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50
ZWwtZ3Z0LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1n
dnQtZGV2
