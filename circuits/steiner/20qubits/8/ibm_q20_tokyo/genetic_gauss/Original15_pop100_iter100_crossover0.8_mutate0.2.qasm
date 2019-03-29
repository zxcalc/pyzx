// Initial wiring: [19, 12, 14, 6, 13, 9, 3, 5, 2, 8, 18, 16, 1, 4, 7, 10, 15, 0, 11, 17]
// Resulting wiring: [19, 12, 14, 6, 13, 9, 3, 5, 2, 8, 18, 16, 1, 4, 7, 10, 15, 0, 11, 17]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[5], q[0];
cx q[11], q[6];
cx q[8], q[3];
cx q[6], q[4];
cx q[16], q[6];
cx q[13], q[10];
cx q[18], q[17];
cx q[8], q[10];
