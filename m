Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a0d:e6c5:0:0:0:0:0 with SMTP id p188csp519679ywe;
        Thu, 21 Feb 2019 09:34:59 -0800 (PST)
X-Google-Smtp-Source: AHgI3Ia3B0sUifH0Rl+mfGuToHMNR+/4cxj5qJiCQxoA58lP8L1yhzpET+EagqrqriMol9lBx0Zb
X-Received: by 2002:a63:a41:: with SMTP id z1mr35373127pgk.117.1550770499024;
        Thu, 21 Feb 2019 09:34:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550770499; cv=none;
        d=google.com; s=arc-20160816;
        b=l6qdbEy23i/jhjC21Md0P0IhqSGGmRFmSsUabvQ23CpMGKbEAsRrSQPejITx7ai+Zq
         qp3wKq9KV8XYW3QU0n6R9GZK06t7zL2570z6hjvZpztGd8GP0+6FE1rsL6/0gbQcUD7c
         eWpb7TNuCyQwi9SlDkBNF7TfVYP3D7Ga99tsL911OGegZ8oXFlKruPmPhtXaN/FcxfUT
         3pYyDVbIsZ5OZm2QX7BoUOQ1OnRdkk6OToGPQNDFZ91BEqjooI/zAsnKFmcqeZkKI7Gd
         SIR3lWN+YMGxy5MtJLWXB3VZngwCvu0asdnRSXhO3BW0zdFXb2PRKBt/GaDzOmsLPs3U
         wINQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:cc:list-subscribe
         :list-help:list-post:list-archive:list-unsubscribe:list-id
         :precedence:mime-version:references:in-reply-to:message-id:subject
         :to:from:date:delivered-to;
        bh=wNaZO59u2vedXmhr3ZQPP2dc6z7pce2jsA/m7AwGnNQ=;
        b=HTqK0E/xq4tVPB3/MUtL4q2dNcCanSajTCsSj25kMvF08LH6FKeMMctlVLnEVoLYZy
         oIJ/NZwmXtTihZJTdWeVdKcqCQMbOjGJ5Ut2U5YRvPMy3VsBbt59UIiaV36XJ9CdDoB9
         c0GA6SmxeIl0EScQrT8gHgBf5trU1qIVADamqJRWTjlMZcc7DQw8PWOvxDdwWBBoiebp
         K9He2HmPe+G2xCrDwKGPjE6ZWTTRrnEJVISJ8jKiQ00tj4rEK8O8ckSMtjVg99eMyae1
         vO2rkkNE26QgcQVmQwEW3ZkSRlugI6fo012J2ofHB/OnnUoFvyYST8FBshUdyEC5aCV9
         PIKg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id a8si20007601pgw.380.2019.02.21.09.34.58
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 Feb 2019 09:34:59 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 445FC896E7;
	Thu, 21 Feb 2019 17:34:58 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0480F896E7
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 21 Feb 2019 17:34:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 7F90CC049589;
 Thu, 21 Feb 2019 17:34:56 +0000 (UTC)
Received: from w520.home (ovpn-116-24.phx2.redhat.com [10.3.116.24])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1E2C760139;
 Thu, 21 Feb 2019 17:34:53 +0000 (UTC)
Date: Thu, 21 Feb 2019 10:34:50 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v2 1/3] vfio/display: add edid support.
Message-ID: <20190221103450.4f37e60f@w520.home>
In-Reply-To: <20190221073850.rgygkl3uyn4rxswl@sirius.home.kraxel.org>
References: <20190220084753.9130-1-kraxel@redhat.com>
 <20190220084753.9130-2-kraxel@redhat.com>
 <20190220145435.1881d7a8@w520.home>
 <20190221073850.rgygkl3uyn4rxswl@sirius.home.kraxel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.31]); Thu, 21 Feb 2019 17:34:56 +0000 (UTC)
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
Cc: intel-gvt-dev@lists.freedesktop.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

T24gVGh1LCAyMSBGZWIgMjAxOSAwODozODo1MCArMDEwMApHZXJkIEhvZmZtYW5uIDxrcmF4ZWxA
cmVkaGF0LmNvbT4gd3JvdGU6Cgo+IE9uIFdlZCwgRmViIDIwLCAyMDE5IGF0IDAyOjU0OjM1UE0g
LTA3MDAsIEFsZXggV2lsbGlhbXNvbiB3cm90ZToKPiA+IE9uIFdlZCwgMjAgRmViIDIwMTkgMDk6
NDc6NTEgKzAxMDAKPiA+IEdlcmQgSG9mZm1hbm4gPGtyYXhlbEByZWRoYXQuY29tPiB3cm90ZToK
PiA+ICAgCj4gPiA+IFRoaXMgcGF0Y2ggYWRkcyBFRElEIHN1cHBvcnQgdG8gdGhlIHZmaW8gZGlz
cGxheSAoYWthIHZncHUpIGNvZGUuCj4gPiA+IFdoZW4gc3VwcG9ydGVkIGJ5IHRoZSBtZGV2IGRy
aXZlciBxZW11IHdpbGwgZ2VuZXJhdGUgYSBFRElEIGJsb2IKPiA+ID4gYW5kIHBhc3MgaXQgb24g
dXNpbmcgdGhlIG5ldyB2ZmlvIGVkaWQgcmVnaW9uLiAgVGhlIEVESUQgYmxvYiB3aWxsCj4gPiA+
IGJlIHVwZGF0ZWQgb24gVUkgY2hhbmdlcyAoaS5lLiB3aW5kb3cgcmVzaXplKSwgc28gdGhlIGd1
ZXN0IGNhbgo+ID4gPiBhZGFwdC4gIAo+ID4gCj4gPiBXaGF0IGFyZSB0aGUgcmVxdWlyZW1lbnRz
IHRvIGVuYWJsZSB0aGlzIHJlc2l6aW5nIGZlYXR1cmU/ICBJIGdyYWJiZWQKPiA+IHRoZSBndnQt
bmV4dC0yMDE5LTAyLTAxIGJyYW5jaCBhbmQgbXkgZXZlciBleHBhbmRpbmcgcWVtdTpjb21tYW5k
bGluZQo+ID4gbm93IGxvb2tzIGxpa2UgdGhpczoKPiA+IAo+ID4gICA8cWVtdTpjb21tYW5kbGlu
ZT4KPiA+ICAgICA8cWVtdTphcmcgdmFsdWU9Jy1zZXQnLz4KPiA+ICAgICA8cWVtdTphcmcgdmFs
dWU9J2RldmljZS5ob3N0ZGV2MC54LWlnZC1vcHJlZ2lvbj1vbicvPgo+ID4gICAgIDxxZW11OmFy
ZyB2YWx1ZT0nLXNldCcvPgo+ID4gICAgIDxxZW11OmFyZyB2YWx1ZT0nZGV2aWNlLmhvc3RkZXYw
LnJhbWZiPW9uJy8+Cj4gPiAgICAgPHFlbXU6YXJnIHZhbHVlPSctc2V0Jy8+Cj4gPiAgICAgPHFl
bXU6YXJnIHZhbHVlPSdkZXZpY2UuaG9zdGRldjAuZHJpdmVyPXZmaW8tcGNpLW5vaG90cGx1Zycv
Pgo+ID4gICAgIDxxZW11OmFyZyB2YWx1ZT0nLXNldCcvPgo+ID4gICAgIDxxZW11OmFyZyB2YWx1
ZT0nZGV2aWNlLmhvc3RkZXYwLnhyZXM9MTYwMCcvPgo+ID4gICAgIDxxZW11OmFyZyB2YWx1ZT0n
LXNldCcvPgo+ID4gICAgIDxxZW11OmFyZyB2YWx1ZT0nZGV2aWNlLmhvc3RkZXYwLnlyZXM9OTAw
Jy8+Cj4gPiAgIDwvcWVtdTpjb21tYW5kbGluZT4KPiA+IAo+ID4gT3RoZXIgcmVsZXZhbnQgc2Vj
dGlvbnM6Cj4gPiAKPiA+ICAgICA8Z3JhcGhpY3MgdHlwZT0nc3BpY2UnPgo+ID4gICAgICAgPGxp
c3RlbiB0eXBlPSdub25lJy8+Cj4gPiAgICAgICA8Z2wgZW5hYmxlPSd5ZXMnIHJlbmRlcm5vZGU9
Jy9kZXYvZHJpL2J5LXBhdGgvcGNpLTAwMDA6MDA6MDIuMC1yZW5kZXInLz4KPiA+ICAgICA8L2dy
YXBoaWNzPiAgCj4gCj4gV2hlbiB1c2luZyBzcGljZSB5b3UgYWxzbyBuZWVkIHRoZSBzcGljZXZt
YyBjaGFubmVsIGFuZCB0aGUgc3BpY2UgYWdlbnQKPiBiZWluZyBpbnN0YWxsZWQgYW5kIGFjdGl2
ZSBpbiB0aGUgZ3Vlc3QuCgpUaGlzIGlzIHRoZSB2ZGFnZW50IHVzaW5nIGluc3RhbGxhdGlvbiBs
aWtlIHRoaXM6CgpodHRwczovL3d3dy5vdmlydC5vcmcvZGV2ZWxvcC9pbmZyYS90ZXN0aW5nL3Nw
aWNlLmh0bWwKCmllLiB2ZHNlcnZpY2UgaW5zdGFsbCwgbmV0IHN0YXJ0IHZkc2VydmljZT8KCkkn
bSBub3Qgc2VlaW5nIGFueXRoaW5nIG1hZ2ljYWxseSBjaGFuZ2Ugd2hlbiBJIGRvIHRoYXQuICBJ
IGRvIGhhdmUgdGhlCmRlZmF1bHQgc2VyaWFsIGFuZCByZWRpcmVjdGlvbiBkZXZpY2VzIGluc3Rh
bGxlZCBieSB2aXJ0LW1hbmFnZXI6CgogICAgIDxzZXJpYWwgdHlwZT0ncHR5Jz4KICAgICAgPHNv
dXJjZSBwYXRoPScvZGV2L3B0cy80Jy8+CiAgICAgIDx0YXJnZXQgdHlwZT0naXNhLXNlcmlhbCcg
cG9ydD0nMCc+CiAgICAgICAgPG1vZGVsIG5hbWU9J2lzYS1zZXJpYWwnLz4KICAgICAgPC90YXJn
ZXQ+CiAgICAgIDxhbGlhcyBuYW1lPSdzZXJpYWwwJy8+CiAgICA8L3NlcmlhbD4KICAgIDxjb25z
b2xlIHR5cGU9J3B0eScgdHR5PScvZGV2L3B0cy80Jz4KICAgICAgPHNvdXJjZSBwYXRoPScvZGV2
L3B0cy80Jy8+CiAgICAgIDx0YXJnZXQgdHlwZT0nc2VyaWFsJyBwb3J0PScwJy8+CiAgICAgIDxh
bGlhcyBuYW1lPSdzZXJpYWwwJy8+CiAgICA8L2NvbnNvbGU+CiAgICA8cmVkaXJkZXYgYnVzPSd1
c2InIHR5cGU9J3NwaWNldm1jJz4KICAgICAgPGFsaWFzIG5hbWU9J3JlZGlyMCcvPgogICAgICA8
YWRkcmVzcyB0eXBlPSd1c2InIGJ1cz0nMCcgcG9ydD0nMicvPgogICAgPC9yZWRpcmRldj4KICAg
IDxyZWRpcmRldiBidXM9J3VzYicgdHlwZT0nc3BpY2V2bWMnPgogICAgICA8YWxpYXMgbmFtZT0n
cmVkaXIxJy8+CiAgICAgIDxhZGRyZXNzIHR5cGU9J3VzYicgYnVzPScwJyBwb3J0PSczJy8+CiAg
ICA8L3JlZGlyZGV2PgoKSSBiZWxpZXZlIEkgaGF2ZSBkcml2ZXJzIGluc3RhbGxlZCwgYnV0IGl0
J3MgYSBiaXQgZGlmZmljdWx0IHRvIHZlcmlmeQpnaXZlbiB0aGUgSW50ZWwgZ3JhcGhpY3MgZ2xp
dGNoZXMgSSBjb3BpZWQgeW91IG9uLgoKPiA+ID4gKyAgICBkcHktPmVkaWRfcmVncy0+bGlua19z
dGF0ZSA9IFZGSU9fREVWSUNFX0dGWF9MSU5LX1NUQVRFX1VQOwo+ID4gPiArICAgIHB3cml0ZV9m
aWVsZChmZCwgZHB5LT5lZGlkX2luZm8sIGRweS0+ZWRpZF9yZWdzLCBsaW5rX3N0YXRlKTsKPiA+
ID4gKyAgICB0cmFjZV92ZmlvX2Rpc3BsYXlfZWRpZF9saW5rX3VwKCk7Cj4gPiA+ICsgICAgcmV0
dXJuOwo+ID4gPiArCj4gPiA+ICtlcnI6Cj4gPiA+ICsgICAgdHJhY2VfdmZpb19kaXNwbGF5X2Vk
aWRfd3JpdGVfZXJyb3IoKTsKPiA+ID4gKyAgICByZXR1cm47ICAKPiA+IAo+ID4gbml0LCBubyB1
bndpbmQgYW5kIG9ubHkgb25lIGNhbGwgcG9pbnQsIGNvdWxkIHByb2JhYmx5IGRvIHdpdGhvdXQg
dGhlCj4gPiBnb3RvLiAgCj4gCj4gTm90IHRoYXQgZWFzaWx5IGR1ZSB0byB0aGUgZ290byBiZWlu
ZyBoaWRkZW4gaW4gdGhlIHB3cml0ZV9maWVsZCgpCj4gbWFjcm8uCgpBaCwgSSBrbmV3IHRob3Nl
IG1hY3JvcyB3ZXJlIGdvaW5nIHRvIGJlIHRyaWNreSwgYnV0IEkgZmVsbCBmb3IgaXQKYW55d2F5
LiAgU29ycnkuCgo+ID4gPiArICAgIHRyYWNlX3ZmaW9fZGlzcGxheV9lZGlkX2F2YWlsYWJsZSgp
Owo+ID4gPiArICAgIGRweS0+ZWRpZF9yZWdzID0gZ19uZXcwKHN0cnVjdCB2ZmlvX3JlZ2lvbl9n
ZnhfZWRpZCwgMSk7Cj4gPiA+ICsgICAgcHJlYWRfZmllbGQoZmQsIGRweS0+ZWRpZF9pbmZvLCBk
cHktPmVkaWRfcmVncywgZWRpZF9vZmZzZXQpOwo+ID4gPiArICAgIHByZWFkX2ZpZWxkKGZkLCBk
cHktPmVkaWRfaW5mbywgZHB5LT5lZGlkX3JlZ3MsIGVkaWRfbWF4X3NpemUpOwo+ID4gPiArICAg
IHByZWFkX2ZpZWxkKGZkLCBkcHktPmVkaWRfaW5mbywgZHB5LT5lZGlkX3JlZ3MsIG1heF94cmVz
KTsKPiA+ID4gKyAgICBwcmVhZF9maWVsZChmZCwgZHB5LT5lZGlkX2luZm8sIGRweS0+ZWRpZF9y
ZWdzLCBtYXhfeXJlcyk7Cj4gPiA+ICsgICAgZHB5LT5lZGlkX2Jsb2IgPSBnX21hbGxvYzAoZHB5
LT5lZGlkX3JlZ3MtPmVkaWRfbWF4X3NpemUpOwo+ID4gPiArCj4gPiA+ICsgICAgdmZpb19kaXNw
bGF5X2VkaWRfdXBkYXRlKHZkZXYsIHRydWUsIDAsIDApOwo+ID4gPiArICAgIHJldHVybjsKPiA+
ID4gKwo+ID4gPiArZXJyOgo+ID4gPiArICAgIGZwcmludGYoc3RkZXJyLCAiJXM6IE9vcHMsIHBy
ZWFkIGVycm9yXG4iLCBfX2Z1bmNfXyk7Cj4gPiA+ICsgICAgZ19mcmVlKGRweS0+ZWRpZF9yZWdz
KTsKPiA+ID4gKyAgICBkcHktPmVkaWRfcmVncyA9IE5VTEw7Cj4gPiA+ICsgICAgcmV0dXJuOyAg
Cj4gPiAKPiA+IFRoaXMgY29kZSBpcyB1bnJlYWNoYWJsZS4gIAo+IAo+IEl0J3Mgbm90LiAgQWdh
aW4sIHRoZSBnb3RvIGlzIGluIHByZWFkX2ZpZWxkLgo+IAo+IEJ1dCBJIGp1c3Qgbm90aWNlZCBJ
IG1pc3NlZCBvbmUgZnByaW50ZiB3aGljaCBzaG91bGQgYmUgYQo+IHRyYWNlX3ZmaW9fZGlzcGxh
eV9lZGlkX3dyaXRlX2Vycm9yKCkgLi4uCgpZZXAuCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmludGVsLWd2dC1kZXYgbWFpbGluZyBsaXN0CmludGVsLWd2
dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ3Z0LWRldg==
