Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:3684:0:0:0:0:0 with SMTP id d126csp1834467ywa;
        Sun, 17 Feb 2019 20:45:36 -0800 (PST)
X-Google-Smtp-Source: AHgI3IbEZFey4ZG8dP/KtxyLoFeK9uR972WrKrOkSalHuRHx7sHUV/pga/fOlDvz7qQWvr8Sh6Zf
X-Received: by 2002:a65:64d9:: with SMTP id t25mr17235558pgv.244.1550465136718;
        Sun, 17 Feb 2019 20:45:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550465136; cv=none;
        d=google.com; s=arc-20160816;
        b=k1TdyLWowYLjdiFTYvbviAXevBZeHQSGRaABG4EZa9je0knjz1+ESL6A3gVKzFD/ob
         oVzeDGnH/yrpChhBL1n+p95TnFRlTt6A0w+ixIoQGGNCqYjFsuJbwA3amsNoiwWfRGaM
         hNGFpjn2oCjp1jiR0uq8oyPOQmjjlPkpSmMLeQw5fH18mGu1NYM4RjzzRs3xpjoP4gBo
         CDGyzzwL1/YeJHZ8kO03i7hGZ4zXg9OXbdapuMeUHb2U/LPhKr4g2rNa5Om+JG/mGlyY
         nLnFYLiGIK49yXvSoNyAD4lvDPoID5k0QuWJhjEvP8mJtIXwTkMavzfm5F+7CrQyrEnW
         hq9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:cc:list-subscribe
         :list-help:list-post:list-archive:list-unsubscribe:list-id
         :precedence:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-filter:delivered-to;
        bh=xRRZw+qmeirHo0TPQcx35q/eR6Aa7tMs4nUwYHVAbvw=;
        b=W5tvXKwP9jDTQiknx+mky6llbixLCFKhfaAjghOpDsaP9SOOUOoQfuPqfrv1HtjcRV
         iEFXiNEd7d97OtGAmLlDt773AiwhcvZVyMyWcveBdxbcIhiE1AOqh/Q+uLy8SdRaTHPu
         xukAZzarnuKRJftU9b2BBuDf+uew1n0BQPihTKZ5bNRH4JWF5fyeOz7CybRXJpL7dwRh
         aEG/TCnau3bUZ3lVwhVdaqYGdKzZtrtJ1u4T3FFOmAitJjfG2t89XBflsIh52+1MbEir
         V+Uv5sJW0eiNx8Xk4NFIyeiIFCK29q7mTiWrayxz9yGK2hogAPtIwzTs558lmndYIaLI
         AZpg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id b60si12378830plc.95.2019.02.17.20.45.36
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 17 Feb 2019 20:45:36 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2ED38914D;
	Mon, 18 Feb 2019 04:45:35 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from condef-04.nifty.com (condef-04.nifty.com [202.248.20.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFC788914D;
 Mon, 18 Feb 2019 04:45:34 +0000 (UTC)
Received: from conssluserg-02.nifty.com ([10.126.8.81])by condef-04.nifty.com
 with ESMTP id x1I4hfhd019752; Mon, 18 Feb 2019 13:43:41 +0900
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com
 [209.85.222.45]) (authenticated)
 by conssluserg-02.nifty.com with ESMTP id x1I4hNB4009301;
 Mon, 18 Feb 2019 13:43:23 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com x1I4hNB4009301
X-Nifty-SrcIP: [209.85.222.45]
Received: by mail-ua1-f45.google.com with SMTP id z11so5391078uaa.10;
 Sun, 17 Feb 2019 20:43:23 -0800 (PST)
X-Gm-Message-State: AHQUAuZ2br91RjZ37Xb7CEVnrHcc034d5+gnO3LsM8hRWEE6Edh/mqCn
 ow/13m6P608i2JhCu8efs32L7XFr1ob8ymceG04=
X-Received: by 2002:ab0:648c:: with SMTP id p12mr6419793uam.93.1550465002431; 
 Sun, 17 Feb 2019 20:43:22 -0800 (PST)
MIME-Version: 1.0
References: <1548906999-22143-1-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1548906999-22143-1-git-send-email-yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Mon, 18 Feb 2019 13:42:46 +0900
X-Gmail-Original-Message-ID: <CAK7LNARkmkQr7Q2rhdB0GVFnvSpspRkoM1f9+=ULJ9y-aXQ3NQ@mail.gmail.com>
Message-ID: <CAK7LNARkmkQr7Q2rhdB0GVFnvSpspRkoM1f9+=ULJ9y-aXQ3NQ@mail.gmail.com>
Subject: Re: [PATCH] drm: prefix header search paths with $(srctree)/
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nifty.com; s=dec2015msa; t=1550465004;
 bh=xsUZFvL5CTUDGQrfaNZH+zG2OPJPifptmxt30v8BUlA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=xyMW8EDkTPYcWQqAhdSFPM7W/DPRVb3qR/BXbRQbn2K0caS8eYhkW3sCF2FitQjpw
 oTN0c87HZk1U+qB+Tc0LGgDXD7j0jgrm023yLyiqLxukfN/iG+gBuBZ/9FNLnX+YRs
 Tsy/fHXReLUVGqdnEI0KwFvOZMg2eyIZZyaXjEJn2Vwlp8ghA6ulO0TRNaQ2XOy+DW
 vepc/L1LnCkraEt9HUPBy96/Yx5h+q1CNkRdPxZUHta4r/t4IC9bhF/uLeYNnOD2yQ
 jd6+UrpOKOwYktmLURQ2Q0JAzzCm7yTTQya9noPNawnG3SH8I+RKHoXng6tGBiBojk
 UVwckovCFL9qw==
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
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 "David \(ChunMing\) Zhou" <David1.Zhou@amd.com>, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, intel-gfx@lists.freedesktop.org,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Rob Clark <robdclark@gmail.com>,
 Ben Skeggs <bskeggs@redhat.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Zhi Wang <zhi.a.wang@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

T24gVGh1LCBKYW4gMzEsIDIwMTkgYXQgMTowMSBQTSBNYXNhaGlybyBZYW1hZGEKPHlhbWFkYS5t
YXNhaGlyb0Bzb2Npb25leHQuY29tPiB3cm90ZToKPgo+IEN1cnJlbnRseSwgdGhlIEtidWlsZCBj
b3JlIG1hbmlwdWxhdGVzIGhlYWRlciBzZWFyY2ggcGF0aHMgaW4gYSBjcmF6eQo+IHdheSBbMV0u
Cj4KPiBUbyBmaXggdGhpcyBtZXNzLCBJIHdhbnQgYWxsIE1ha2VmaWxlcyB0byBhZGQgZXhwbGlj
aXQgJChzcmN0cmVlKS8gdG8KPiB0aGUgc2VhcmNoIHBhdGhzIGluIHRoZSBzcmN0cmVlLiBTb21l
IE1ha2VmaWxlcyBhcmUgYWxyZWFkeSB3cml0dGVuIGluCj4gdGhhdCB3YXksIGJ1dCBub3QgYWxs
LiBUaGUgZ29hbCBvZiB0aGlzIHdvcmsgaXMgdG8gbWFrZSB0aGUgbm90YXRpb24KPiBjb25zaXN0
ZW50LCBhbmQgZmluYWxseSBnZXQgcmlkIG9mIHRoZSBncm9zcyBoYWNrcy4KPgo+IEhhdmluZyB3
aGl0ZXNwYWNlcyBhZnRlciAtSSBkb2VzIG5vdCBtYXR0ZXIgc2luY2UgY29tbWl0IDQ4ZjZlM2Nm
NWJjNgo+ICgia2J1aWxkOiBkbyBub3QgZHJvcCAtSSB3aXRob3V0IHBhcmFtZXRlciIpLgo+Cj4g
WzFdOiBodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3BhdGNoLzk2MzIzNDcvCj4KPiBTaWdu
ZWQtb2ZmLWJ5OiBNYXNhaGlybyBZYW1hZGEgPHlhbWFkYS5tYXNhaGlyb0Bzb2Npb25leHQuY29t
Pgo+IC0tLQoKCkNvdWxkIHlvdSB0YWtlIGEgbG9vayBhdCB0aGlzIHNlcmllcywgcGxlYXNlPwoK
VGhhbmtzLgoKCgoKCj4gSSBwdXQgYWxsIGdwdS9kcm0gY2hhbmdlcyBpbnRvIGEgc2luZ2xlIHBh
dGNoIGJlY2F1c2UKPiB0aGV5IGFyZSB0cml2aWFsIGNvbnZlcnNpb24uCj4KPiBQbGVhc2UgbGV0
IG1lIGtub3cgaWYgSSBuZWVkIHRvIHNwbGl0IHRoaXMgaW50byBwZXItZHJpdmVyIHBhdGNoZXMu
Cj4KPgo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9NYWtlZmlsZSB8IDIgKy0KPiAgZHJp
dmVycy9ncHUvZHJtL2FtZC9saWIvTWFrZWZpbGUgICAgfCAyICstCj4gIGRyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2d2dC9NYWtlZmlsZSAgIHwgMiArLQo+ICBkcml2ZXJzL2dwdS9kcm0vbXNtL01ha2Vm
aWxlICAgICAgICB8IDYgKysrLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L0tidWlsZCAg
ICAgIHwgOCArKysrLS0tLQo+ICA1IGZpbGVzIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDEw
IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L01ha2VmaWxlIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvTWFrZWZpbGUKPiBpbmRleCBm
NzZiY2I5Li5iMjFlYmIwIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L01ha2VmaWxlCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvTWFrZWZpbGUKPiBA
QCAtMjMsNyArMjMsNyBAQAo+ICAjIE1ha2VmaWxlIGZvciB0aGUgZHJtIGRldmljZSBkcml2ZXIu
ICBUaGlzIGRyaXZlciBwcm92aWRlcyBzdXBwb3J0IGZvciB0aGUKPiAgIyBEaXJlY3QgUmVuZGVy
aW5nIEluZnJhc3RydWN0dXJlIChEUkkpIGluIFhGcmVlODYgNC4xLjAgYW5kIGhpZ2hlci4KPgo+
IC1GVUxMX0FNRF9QQVRIPSQoc3JjKS8uLgo+ICtGVUxMX0FNRF9QQVRIPSQoc3JjdHJlZSkvJChz
cmMpLy4uCj4gIERJU1BMQVlfRk9MREVSX05BTUU9ZGlzcGxheQo+ICBGVUxMX0FNRF9ESVNQTEFZ
X1BBVEggPSAkKEZVTExfQU1EX1BBVEgpLyQoRElTUExBWV9GT0xERVJfTkFNRSkKPgo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2xpYi9NYWtlZmlsZSBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvbGliL01ha2VmaWxlCj4gaW5kZXggNjkwMjQzMC4uZDUzNDk5MiAxMDA2NDQKPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2xpYi9NYWtlZmlsZQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvbGliL01ha2VmaWxlCj4gQEAgLTI3LDYgKzI3LDYgQEAKPiAgIyBkcml2ZXIgY29tcG9u
ZW50cyBvciBsYXRlciBtb3ZlZCB0byBrZXJuZWwvbGliIGZvciBzaGFyaW5nIHdpdGgKPiAgIyBv
dGhlciBkcml2ZXJzLgo+Cj4gLWNjZmxhZ3MteSA6PSAtSSQoc3JjKS8uLi9pbmNsdWRlCj4gK2Nj
ZmxhZ3MteSA6PSAtSSAkKHNyY3RyZWUpLyQoc3JjKS8uLi9pbmNsdWRlCj4KPiAgb2JqLSQoQ09O
RklHX0NIQVNIKSArPSBjaGFzaC5vCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1
L2d2dC9NYWtlZmlsZSBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9NYWtlZmlsZQo+IGluZGV4
IGIwMTZkYzcuLmE0YTVhOTYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0
L01ha2VmaWxlCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L01ha2VmaWxlCj4gQEAg
LTUsNiArNSw2IEBAIEdWVF9TT1VSQ0UgOj0gZ3Z0Lm8gYXBlcnR1cmVfZ20ubyBoYW5kbGVycy5v
IHZncHUubyB0cmFjZV9wb2ludHMubyBmaXJtd2FyZS5vIFwKPiAgICAgICAgIGV4ZWNsaXN0Lm8g
c2NoZWR1bGVyLm8gc2NoZWRfcG9saWN5Lm8gbW1pb19jb250ZXh0Lm8gY21kX3BhcnNlci5vIGRl
YnVnZnMubyBcCj4gICAgICAgICBmYl9kZWNvZGVyLm8gZG1hYnVmLm8gcGFnZV90cmFjay5vCj4K
PiAtY2NmbGFncy15ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKz0gLUkkKHNyYykgLUkk
KHNyYykvJChHVlRfRElSKQo+ICtjY2ZsYWdzLXkgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICArPSAtSSAkKHNyY3RyZWUpLyQoc3JjKSAtSSAkKHNyY3RyZWUpLyQoc3JjKS8kKEdWVF9ESVIp
Lwo+ICBpOTE1LXkgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICArPSAkKGFkZHByZWZp
eCAkKEdWVF9ESVIpLywgJChHVlRfU09VUkNFKSkKPiAgb2JqLSQoQ09ORklHX0RSTV9JOTE1X0dW
VF9LVk1HVCkgICAgICAgKz0gJChHVlRfRElSKS9rdm1ndC5vCj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9tc20vTWFrZWZpbGUgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL01ha2VmaWxlCj4g
aW5kZXggNTZhNzBjNy4uYjdiMWViZCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbXNt
L01ha2VmaWxlCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21zbS9NYWtlZmlsZQo+IEBAIC0xLDcg
KzEsNyBAQAo+ICAjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wCj4gLWNjZmxhZ3Mt
eSA6PSAtSWRyaXZlcnMvZ3B1L2RybS9tc20KPiAtY2NmbGFncy15ICs9IC1JZHJpdmVycy9ncHUv
ZHJtL21zbS9kaXNwL2RwdTEKPiAtY2NmbGFncy0kKENPTkZJR19EUk1fTVNNX0RTSSkgKz0gLUlk
cml2ZXJzL2dwdS9kcm0vbXNtL2RzaQo+ICtjY2ZsYWdzLXkgOj0gLUkgJChzcmN0cmVlKS8kKHNy
YykKPiArY2NmbGFncy15ICs9IC1JICQoc3JjdHJlZSkvJChzcmMpL2Rpc3AvZHB1MQo+ICtjY2Zs
YWdzLSQoQ09ORklHX0RSTV9NU01fRFNJKSArPSAtSSAkKHNyY3RyZWUpLyQoc3JjKS9kc2kKPgo+
ICBtc20teSA6PSBcCj4gICAgICAgICBhZHJlbm8vYWRyZW5vX2RldmljZS5vIFwKPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvS2J1aWxkIGIvZHJpdmVycy9ncHUvZHJtL25v
dXZlYXUvS2J1aWxkCj4gaW5kZXggYjE3ODQzZC4uYjRiYzg4YWQgMTAwNjQ0Cj4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL25vdXZlYXUvS2J1aWxkCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL25vdXZl
YXUvS2J1aWxkCj4gQEAgLTEsNyArMSw3IEBACj4gLWNjZmxhZ3MteSArPSAtSSQoc3JjKS9pbmNs
dWRlCj4gLWNjZmxhZ3MteSArPSAtSSQoc3JjKS9pbmNsdWRlL252a20KPiAtY2NmbGFncy15ICs9
IC1JJChzcmMpL252a20KPiAtY2NmbGFncy15ICs9IC1JJChzcmMpCj4gK2NjZmxhZ3MteSArPSAt
SSAkKHNyY3RyZWUpLyQoc3JjKS9pbmNsdWRlCj4gK2NjZmxhZ3MteSArPSAtSSAkKHNyY3RyZWUp
LyQoc3JjKS9pbmNsdWRlL252a20KPiArY2NmbGFncy15ICs9IC1JICQoc3JjdHJlZSkvJChzcmMp
L252a20KPiArY2NmbGFncy15ICs9IC1JICQoc3JjdHJlZSkvJChzcmMpCj4KPiAgIyBOVktNIC0g
SFcgcmVzb3VyY2UgbWFuYWdlcgo+ICAjLSBjb2RlIGFsc28gdXNlZCBieSB2YXJpb3VzIHVzZXJz
cGFjZSB0b29scy90ZXN0cwo+IC0tCj4gMi43LjQKPgoKCi0tIApCZXN0IFJlZ2FyZHMKTWFzYWhp
cm8gWWFtYWRhCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmludGVsLWd2dC1kZXYgbWFpbGluZyBsaXN0CmludGVsLWd2dC1kZXZAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50
ZWwtZ3Z0LWRldg==
