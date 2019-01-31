Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a0d:d7d3:0:0:0:0:0 with SMTP id z202csp1220119ywd;
        Thu, 31 Jan 2019 10:02:06 -0800 (PST)
X-Google-Smtp-Source: ALg8bN68OXg6ufb0+bAfcQdUjq8VDQAZszYtIhuJoHANcKRKRmzNWckFKUhkDJTHwng7qa/n+iRG
X-Received: by 2002:a63:5d20:: with SMTP id r32mr32680183pgb.329.1548957726137;
        Thu, 31 Jan 2019 10:02:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548957726; cv=none;
        d=google.com; s=arc-20160816;
        b=vyitSeVYvAN9RUS/KrZe9rsIeXxg/VxCxDixYq+Z9e/pSW3/KRentKm+oT18qgmh/T
         cvHNRw1/oqtAzScsBu4LeiCooHobjBA0iqpNCHNhT+Za32jd1nj5mKg/IRdPGs/4x66O
         MuHbr1F3d2fyyt+TtDHkzghwcY/PVqdaMcD7NpvdsDRT7M0pO91eYSqyKfGi48i721ce
         iD/eEf7bGN/vEmD1rjCmsxrEoFIYq08/Tf1tF1KUSbRlvieADBk6hPSR9Off5E0qFc02
         tHDSfbAezbNpozFJ5fNV7rLyT54K8kzYe0s6QMzsHhhhPkd2BDHPErFUfD3gCxhVnP6R
         vIQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:cc:list-subscribe
         :list-help:list-post:list-archive:list-unsubscribe:list-id
         :precedence:user-agent:in-reply-to:content-disposition:mime-version
         :references:message-id:subject:to:from:date:delivered-to;
        bh=9e9qiGOdZSlz1lGEWbA80F35TTnRA8itj5BH+TbPWak=;
        b=a60DSNDHaJmuTklCdTIUNKX3rqmT6A66GGpNCS2ztG5drAaf2p3Pis8xi2kNdp1VD9
         LpNFSVheW5J+iZUpV2Y5hLdYetOHvtnDm+4Hw/WyGnSYeIBIS6CM5PfZYkr/lH57Bl/g
         5vBlVRfhUlmM4LVbm0bCZz4f6fQipEGxZ7da9eyTq867eiJOtgczThI04RZzTvrW/EjJ
         BTsKmAuj/+l7VbSahcCa+aIufJ7/vzgcM0P+QblYJPL4ybA6iusyH+ZGbeb+opKxe4TA
         Wk0UYLXMsKT8dtAtCkYzC2dZOQXiNau4GW9pKVqm1PAteQ0OMb3sE5ZQGk28OjhA7yj9
         WmIQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id a6si1738374pfo.90.2019.01.31.10.02.05
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 31 Jan 2019 10:02:06 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F86889F97;
	Thu, 31 Jan 2019 18:02:05 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DCB389F97;
 Thu, 31 Jan 2019 18:02:04 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 31 Jan 2019 10:02:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,545,1539673200"; d="scan'208";a="111404603"
Received: from rdvivi-losangeles.jf.intel.com (HELO intel.com) ([10.7.196.65])
 by orsmga007.jf.intel.com with ESMTP; 31 Jan 2019 10:02:03 -0800
Date: Thu, 31 Jan 2019 10:02:05 -0800
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: Re: [Intel-gfx] [PULL] gvt-next
Message-ID: <20190131180205.GC19523@intel.com>
References: <20190124054048.GO7203@zhen-hp.sh.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190124054048.GO7203@zhen-hp.sh.intel.com>
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

T24gVGh1LCBKYW4gMjQsIDIwMTkgYXQgMDE6NDA6NDhQTSArMDgwMCwgWmhlbnl1IFdhbmcgd3Jv
dGU6Cj4gCj4gSGksCj4gCj4gSGVyZSBpcyBndnQtbmV4dCBzdHVmZi4gVGhpcyBpbmNsdWRlcyBD
b2ZmZWVsYWtlIHN1cHBvcnQgZm9yIEdWVCwKPiBtYWtpbmcga3ZtZ3QgYXMgc2VsZiBsb2FkIG1v
ZHVsZSB0byBoYXZlIGJldHRlciBkZXBlbmRlbmNlIHdpdGgKPiB2ZmlvL21kZXYsIHdpdGggc29t
ZSBjb25zdCB0cmVhdG1lbnQgYW5kIGtlcm5lbCB0eXBlIGNoYW5nZS4KCm9wcywgSSBhbHNvIGZh
aWxlZCB0byBsZXQgeW91IGtub3cgSSBoYWQgcHVsbGVkIHRoaXMuCgpJIGFsc28gYWxyZWFkeSBz
ZW50IGluIHByZXZpb3VzIHB1bGwgcmVxdWVzdCB0byBEYXZlIGFuZCBEYW5pZWwuCgpTb3JyeSwK
Um9kcmlnby4KCj4gCj4gVGhhbmtzLgo+IC0tCj4gVGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNl
IGNvbW1pdCBkMTgxMDkwOWQ4NDEzMTRiYTk0YjE0ZGMzZGU5ZTlmYmMxM2IwNDZhOgo+IAo+ICAg
ZHJtL2k5MTUvZ3Z0OiBmaXggc3BlbGxpbmcgbWlzdGFrZSAiSW50ZXJ1cHRzIiAtPiAiSW50ZXJy
dXB0cyIgKDIwMTgtMTItMDcgMTI6MDE6MDkgKzA4MDApCj4gCj4gYXJlIGF2YWlsYWJsZSBpbiB0
aGUgR2l0IHJlcG9zaXRvcnkgYXQ6Cj4gCj4gICBodHRwczovL2dpdGh1Yi5jb20vaW50ZWwvZ3Z0
LWxpbnV4LmdpdCB0YWdzL2d2dC1uZXh0LTIwMTktMDEtMjQKPiAKPiBmb3IgeW91IHRvIGZldGNo
IGNoYW5nZXMgdXAgdG8gMmU2NzlkNDhmMzhjMzc4NjUwZGI0MDNiNGJhMjI0OGFkZjA2OTFiMjoK
PiAKPiAgIGRybS9pOTE1L2d2dDogc3dpdGNoIHRvIGtlcm5lbCB0eXBlcyAoMjAxOS0wMS0yMyAx
Mzo1NjoxNCArMDgwMCkKPiAKPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gZ3Z0LW5leHQtMjAxOS0wMS0yNAo+IAo+IC0g
c3BsaXQga3ZtZ3QgYXMgc2VwZXJhdGUgbW9kdWxlIChaaGVueXUpCj4gLSBDb2ZmZWVsYWtlIEdW
VCBzdXBwb3J0IChGcmVkKQo+IC0gY29uc3QgdHJlYXRtZW50IGFuZCBjaGFuZ2UgZm9yIGtlcm5l
bCB0eXBlIChKYW5pKQo+IAo+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiBKYW5pIE5pa3VsYSAoNCk6Cj4gICAgICAgZHJt
L2k5MTUvZ3Z0OiByZW1vdmUgZHJtUC5oIGluY2x1ZGUKPiAgICAgICBkcm0vaTkxNS9ndnQ6IGdp
dmUgdGhlIGNtZCBwYXJzZXIgZGVjb2RlX2luZm8gYSBjb25zdCB0cmVhdG1lbnQKPiAgICAgICBk
cm0vaTkxNS9ndnQ6IGdpdmUgdGhlIGNtZCBwYXJzZXIgY21kX2luZm8gYSBjb25zdCB0cmVhdG1l
bnQKPiAgICAgICBkcm0vaTkxNS9ndnQ6IHN3aXRjaCB0byBrZXJuZWwgdHlwZXMKPiAKPiBaaGVu
eXUgV2FuZyAoMyk6Cj4gICAgICAgZHJtL2k5MTUvZ3Z0OiBtYW5kYXRvcnkgcmVxdWlyZSBoeXBl
cnZpc29yJ3MgaG9zdF9pbml0Cj4gICAgICAgZHJtL2k5MTUvZ3Z0OiByZW1vdmUgdW51c2VkIHBh
cmFtZXRlciBmb3IgaHlwZXJ2aXNvcidzIGhvc3RfZXhpdCBjYWxsCj4gICAgICAgZHJtL2k5MTUv
Z3Z0OiBDaGFuZ2UgS1ZNR1QgYXMgc2VsZiBsb2FkIG1vZHVsZQo+IAo+IGZyZWQgZ2FvICg2KToK
PiAgICAgICBkcm0vaTkxNS9ndnQ6IEFkZCBjb2ZmZWVsYWtlIHBsYXRmb3JtIGRlZmluaXRpb24K
PiAgICAgICBkcm0vaTkxNS9ndnQ6IEFkZCBtbWlvIGhhbmRsZXIgZm9yIENGTAo+ICAgICAgIGRy
bS9pOTE1L2d2dDogRW5hYmxlIGdmeCB2aXJ0dWFsaXp0aW9uIGZvciBDRkwKPiAgICAgICBkcm0v
aTkxNS9ndnQ6IFJldXNlIHRoZSBnbWJ1cyBwaW4gbWFjcm8KPiAgICAgICBkcm0vaTkxNS9ndnQ6
IFJlZmluZSBwb3J0IHNlbGVjdCBsb2dpYyBmb3IgQ0ZMIHBsYXRmb3JtCj4gICAgICAgZHJtL2k5
MTU6IEVuYWJsZSBnZnggdmlydHVhbGl6YXRpb24gZm9yIENvZmZlZWxha2UgcGxhdGZvcm0KPiAK
PiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvTWFrZWZpbGUgICAgICAgICAgIHwgICAxICsKPiAgZHJp
dmVycy9ncHUvZHJtL2k5MTUvZ3Z0L01ha2VmaWxlICAgICAgIHwgICAxIC0KPiAgZHJpdmVycy9n
cHUvZHJtL2k5MTUvZ3Z0L2NtZF9wYXJzZXIuYyAgIHwgIDgzICsrKysrKysrKysrKy0tLS0tLS0t
LS0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZGlzcGxheS5jICAgICAgfCAgMTIgKyst
LQo+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZG1hYnVmLmMgICAgICAgfCAgIDUgKy0KPiAg
ZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2VkaWQuYyAgICAgICAgIHwgIDMyICsrKysrKystLS0K
PiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2ZiX2RlY29kZXIuYyAgIHwgIDEyICstLS0KPiAg
ZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2d2dC5jICAgICAgICAgIHwgMTA4ICsrKysrKysrKysr
KystLS0tLS0tLS0tLS0tLS0tLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9ndnQuaCAg
ICAgICAgICB8ICAgNiArLQo+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvaGFuZGxlcnMuYyAg
ICAgfCAgMjkgKysrKy0tLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9oeXBlcmNhbGwu
aCAgICB8ICAgOSArKy0KPiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2ludGVycnVwdC5jICAg
IHwgICA0ICstCj4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9rdm1ndC5jICAgICAgICB8ICA0
MiArKysrKysrKy0tLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9tbWlvLmMgICAgICAg
ICB8ICAgNiArLQo+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvbW1pby5oICAgICAgICAgfCAg
MTEgKystLQo+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvbW1pb19jb250ZXh0LmMgfCAgMTgg
KysrLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9tcHQuaCAgICAgICAgICB8ICAxMyAr
Ky0tCj4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9zY2hlZF9wb2xpY3kuYyB8ICAgMiArLQo+
ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvc2NoZWR1bGVyLmMgICAgfCAgIDcgKy0tCj4gIGRy
aXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9zY2hlZHVsZXIuaCAgICB8ICAgMiArLQo+ICBkcml2ZXJz
L2dwdS9kcm0vaTkxNS9ndnQvdHJhY2UuaCAgICAgICAgfCAgIDIgKy0KPiAgZHJpdmVycy9ncHUv
ZHJtL2k5MTUvaW50ZWxfZ3Z0LmMgICAgICAgIHwgIDEyICstLS0KPiAgMjIgZmlsZXMgY2hhbmdl
ZCwgMjA0IGluc2VydGlvbnMoKyksIDIxMyBkZWxldGlvbnMoLSkKPiAKPiAKPiAtLSAKPiBPcGVu
IFNvdXJjZSBUZWNobm9sb2d5IENlbnRlciwgSW50ZWwgbHRkLgo+IAo+ICRncGcgLS1rZXlzZXJ2
ZXIgd3d3a2V5cy5wZ3AubmV0IC0tcmVjdi1rZXlzIDRENzgxODI3CgoKCj4gX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBJbnRlbC1nZnggbWFpbGluZyBs
aXN0Cj4gSW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ2Z4CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppbnRlbC1ndnQtZGV2IG1haWxpbmcgbGlz
dAppbnRlbC1ndnQtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWd2dC1kZXYK
