Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:84d4:0:0:0:0:0 with SMTP id u203csp5154619ywf;
        Wed, 20 Feb 2019 23:38:57 -0800 (PST)
X-Google-Smtp-Source: AHgI3Ia10KMQ0tMsb2iL06Z37efbo1N+Q4ZOl79i6GPqpBgGz9PrvVxwG9wweHNb5QUg8rIRpV7a
X-Received: by 2002:a62:cf81:: with SMTP id b123mr19255128pfg.29.1550734736941;
        Wed, 20 Feb 2019 23:38:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550734736; cv=none;
        d=google.com; s=arc-20160816;
        b=OEaLlg8lLCPJnnZnyAOr99KOZS9qB1/1zH7A2pNyxjSQpx7YWfhinCvsD4en/QlkD8
         m9ssa2uzARFYPqGhy6aHl3AZfycPe/HKj205IXQAOGqfMMRKHuJhbyMfGC66i6B4TFuH
         k/jKJrdONlvpFSExCKaxPsHd3+Vc2Ki96+JlpMnJVU3Z1I5zTc0WHo6wx9AC29sqjHvd
         PDDe8ix6qpzks8ymMSPbI4/1EN03kgfTeLJ/GoZV7Bcm2e9yYnA+DelMO6GWxOJH/vDh
         MlfVqjASe5K995x9ih7mDlhQ9/mMCkIM7Vz8Y3gKoACMaJfPz8i/ZlVq2nON+e6frbp7
         x9Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:cc:list-subscribe
         :list-help:list-post:list-archive:list-unsubscribe:list-id
         :precedence:user-agent:in-reply-to:content-disposition:mime-version
         :references:message-id:subject:to:from:date:delivered-to;
        bh=U0+JvkzciX3Ncp9UW+iKTs0rvCopPaZLs6d0pQawHw0=;
        b=Hq3U/RdFRNUYW3bysIrvCxELItgWw/JUmbxYeL7+TS1xuvJ4JF3ogAQF8yMrU+S2eu
         nKvGOOlE3aymehQeGdMlycLPt1eKi/JfbzScFUB/FBmp1DGa1taNHfcvs8fvQtVXoqs7
         WL2DPljJNNcRlL1igBLzgn/K093R5OjD6U+diCdyyjeMnoD4TfUmDDrVXZJVohHAzcLH
         KITzfYr/jPs0HyzQYwj7/LOeIRPK8J9VQRRuWn+HwVystJNILwMPziWaEPGc5Ln6WkMS
         yRyaeZ7MnDUiiWZBJNQYoc6Ix2ECXtPluknw65EtgmXdgU7q7yFl7ExJJGIgNkErNUaB
         5KIw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id e67si22725762plb.107.2019.02.20.23.38.56
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 20 Feb 2019 23:38:56 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E24F88919B;
	Thu, 21 Feb 2019 07:38:55 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80A648919B
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 21 Feb 2019 07:38:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 1B9A283F45;
 Thu, 21 Feb 2019 07:38:54 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-228.ams2.redhat.com
 [10.36.116.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 984C75D706;
 Thu, 21 Feb 2019 07:38:51 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id D2ED411AA4; Thu, 21 Feb 2019 08:38:50 +0100 (CET)
Date: Thu, 21 Feb 2019 08:38:50 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: Re: [PATCH v2 1/3] vfio/display: add edid support.
Message-ID: <20190221073850.rgygkl3uyn4rxswl@sirius.home.kraxel.org>
References: <20190220084753.9130-1-kraxel@redhat.com>
 <20190220084753.9130-2-kraxel@redhat.com>
 <20190220145435.1881d7a8@w520.home>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190220145435.1881d7a8@w520.home>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.27]); Thu, 21 Feb 2019 07:38:54 +0000 (UTC)
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

T24gV2VkLCBGZWIgMjAsIDIwMTkgYXQgMDI6NTQ6MzVQTSAtMDcwMCwgQWxleCBXaWxsaWFtc29u
IHdyb3RlOgo+IE9uIFdlZCwgMjAgRmViIDIwMTkgMDk6NDc6NTEgKzAxMDAKPiBHZXJkIEhvZmZt
YW5uIDxrcmF4ZWxAcmVkaGF0LmNvbT4gd3JvdGU6Cj4gCj4gPiBUaGlzIHBhdGNoIGFkZHMgRURJ
RCBzdXBwb3J0IHRvIHRoZSB2ZmlvIGRpc3BsYXkgKGFrYSB2Z3B1KSBjb2RlLgo+ID4gV2hlbiBz
dXBwb3J0ZWQgYnkgdGhlIG1kZXYgZHJpdmVyIHFlbXUgd2lsbCBnZW5lcmF0ZSBhIEVESUQgYmxv
Ygo+ID4gYW5kIHBhc3MgaXQgb24gdXNpbmcgdGhlIG5ldyB2ZmlvIGVkaWQgcmVnaW9uLiAgVGhl
IEVESUQgYmxvYiB3aWxsCj4gPiBiZSB1cGRhdGVkIG9uIFVJIGNoYW5nZXMgKGkuZS4gd2luZG93
IHJlc2l6ZSksIHNvIHRoZSBndWVzdCBjYW4KPiA+IGFkYXB0Lgo+IAo+IFdoYXQgYXJlIHRoZSBy
ZXF1aXJlbWVudHMgdG8gZW5hYmxlIHRoaXMgcmVzaXppbmcgZmVhdHVyZT8gIEkgZ3JhYmJlZAo+
IHRoZSBndnQtbmV4dC0yMDE5LTAyLTAxIGJyYW5jaCBhbmQgbXkgZXZlciBleHBhbmRpbmcgcWVt
dTpjb21tYW5kbGluZQo+IG5vdyBsb29rcyBsaWtlIHRoaXM6Cj4gCj4gICA8cWVtdTpjb21tYW5k
bGluZT4KPiAgICAgPHFlbXU6YXJnIHZhbHVlPSctc2V0Jy8+Cj4gICAgIDxxZW11OmFyZyB2YWx1
ZT0nZGV2aWNlLmhvc3RkZXYwLngtaWdkLW9wcmVnaW9uPW9uJy8+Cj4gICAgIDxxZW11OmFyZyB2
YWx1ZT0nLXNldCcvPgo+ICAgICA8cWVtdTphcmcgdmFsdWU9J2RldmljZS5ob3N0ZGV2MC5yYW1m
Yj1vbicvPgo+ICAgICA8cWVtdTphcmcgdmFsdWU9Jy1zZXQnLz4KPiAgICAgPHFlbXU6YXJnIHZh
bHVlPSdkZXZpY2UuaG9zdGRldjAuZHJpdmVyPXZmaW8tcGNpLW5vaG90cGx1ZycvPgo+ICAgICA8
cWVtdTphcmcgdmFsdWU9Jy1zZXQnLz4KPiAgICAgPHFlbXU6YXJnIHZhbHVlPSdkZXZpY2UuaG9z
dGRldjAueHJlcz0xNjAwJy8+Cj4gICAgIDxxZW11OmFyZyB2YWx1ZT0nLXNldCcvPgo+ICAgICA8
cWVtdTphcmcgdmFsdWU9J2RldmljZS5ob3N0ZGV2MC55cmVzPTkwMCcvPgo+ICAgPC9xZW11OmNv
bW1hbmRsaW5lPgo+IAo+IE90aGVyIHJlbGV2YW50IHNlY3Rpb25zOgo+IAo+ICAgICA8Z3JhcGhp
Y3MgdHlwZT0nc3BpY2UnPgo+ICAgICAgIDxsaXN0ZW4gdHlwZT0nbm9uZScvPgo+ICAgICAgIDxn
bCBlbmFibGU9J3llcycgcmVuZGVybm9kZT0nL2Rldi9kcmkvYnktcGF0aC9wY2ktMDAwMDowMDow
Mi4wLXJlbmRlcicvPgo+ICAgICA8L2dyYXBoaWNzPgoKV2hlbiB1c2luZyBzcGljZSB5b3UgYWxz
byBuZWVkIHRoZSBzcGljZXZtYyBjaGFubmVsIGFuZCB0aGUgc3BpY2UgYWdlbnQKYmVpbmcgaW5z
dGFsbGVkIGFuZCBhY3RpdmUgaW4gdGhlIGd1ZXN0LgoKPiA+ICsgICAgZHB5LT5lZGlkX3JlZ3Mt
Pmxpbmtfc3RhdGUgPSBWRklPX0RFVklDRV9HRlhfTElOS19TVEFURV9VUDsKPiA+ICsgICAgcHdy
aXRlX2ZpZWxkKGZkLCBkcHktPmVkaWRfaW5mbywgZHB5LT5lZGlkX3JlZ3MsIGxpbmtfc3RhdGUp
Owo+ID4gKyAgICB0cmFjZV92ZmlvX2Rpc3BsYXlfZWRpZF9saW5rX3VwKCk7Cj4gPiArICAgIHJl
dHVybjsKPiA+ICsKPiA+ICtlcnI6Cj4gPiArICAgIHRyYWNlX3ZmaW9fZGlzcGxheV9lZGlkX3dy
aXRlX2Vycm9yKCk7Cj4gPiArICAgIHJldHVybjsKPiAKPiBuaXQsIG5vIHVud2luZCBhbmQgb25s
eSBvbmUgY2FsbCBwb2ludCwgY291bGQgcHJvYmFibHkgZG8gd2l0aG91dCB0aGUKPiBnb3RvLgoK
Tm90IHRoYXQgZWFzaWx5IGR1ZSB0byB0aGUgZ290byBiZWluZyBoaWRkZW4gaW4gdGhlIHB3cml0
ZV9maWVsZCgpCm1hY3JvLgoKPiA+ICsgICAgdHJhY2VfdmZpb19kaXNwbGF5X2VkaWRfYXZhaWxh
YmxlKCk7Cj4gPiArICAgIGRweS0+ZWRpZF9yZWdzID0gZ19uZXcwKHN0cnVjdCB2ZmlvX3JlZ2lv
bl9nZnhfZWRpZCwgMSk7Cj4gPiArICAgIHByZWFkX2ZpZWxkKGZkLCBkcHktPmVkaWRfaW5mbywg
ZHB5LT5lZGlkX3JlZ3MsIGVkaWRfb2Zmc2V0KTsKPiA+ICsgICAgcHJlYWRfZmllbGQoZmQsIGRw
eS0+ZWRpZF9pbmZvLCBkcHktPmVkaWRfcmVncywgZWRpZF9tYXhfc2l6ZSk7Cj4gPiArICAgIHBy
ZWFkX2ZpZWxkKGZkLCBkcHktPmVkaWRfaW5mbywgZHB5LT5lZGlkX3JlZ3MsIG1heF94cmVzKTsK
PiA+ICsgICAgcHJlYWRfZmllbGQoZmQsIGRweS0+ZWRpZF9pbmZvLCBkcHktPmVkaWRfcmVncywg
bWF4X3lyZXMpOwo+ID4gKyAgICBkcHktPmVkaWRfYmxvYiA9IGdfbWFsbG9jMChkcHktPmVkaWRf
cmVncy0+ZWRpZF9tYXhfc2l6ZSk7Cj4gPiArCj4gPiArICAgIHZmaW9fZGlzcGxheV9lZGlkX3Vw
ZGF0ZSh2ZGV2LCB0cnVlLCAwLCAwKTsKPiA+ICsgICAgcmV0dXJuOwo+ID4gKwo+ID4gK2VycjoK
PiA+ICsgICAgZnByaW50ZihzdGRlcnIsICIlczogT29wcywgcHJlYWQgZXJyb3JcbiIsIF9fZnVu
Y19fKTsKPiA+ICsgICAgZ19mcmVlKGRweS0+ZWRpZF9yZWdzKTsKPiA+ICsgICAgZHB5LT5lZGlk
X3JlZ3MgPSBOVUxMOwo+ID4gKyAgICByZXR1cm47Cj4gCj4gVGhpcyBjb2RlIGlzIHVucmVhY2hh
YmxlLgoKSXQncyBub3QuICBBZ2FpbiwgdGhlIGdvdG8gaXMgaW4gcHJlYWRfZmllbGQuCgpCdXQg
SSBqdXN0IG5vdGljZWQgSSBtaXNzZWQgb25lIGZwcmludGYgd2hpY2ggc2hvdWxkIGJlIGEKdHJh
Y2VfdmZpb19kaXNwbGF5X2VkaWRfd3JpdGVfZXJyb3IoKSAuLi4KCmNoZWVycywKICBHZXJkCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppbnRlbC1ndnQt
ZGV2IG1haWxpbmcgbGlzdAppbnRlbC1ndnQtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWd2dC1kZXY=
