// Initial wiring: [2, 6, 1, 8, 5, 12, 9, 3, 11, 16, 0, 18, 19, 7, 17, 10, 15, 13, 14, 4]
// Resulting wiring: [2, 6, 1, 8, 5, 12, 9, 3, 11, 16, 0, 18, 19, 7, 17, 10, 15, 13, 14, 4]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[1], q[0];
cx q[2], q[1];
cx q[1], q[0];
cx q[7], q[2];
cx q[13], q[7];
cx q[7], q[1];
cx q[13], q[7];
cx q[17], q[16];
cx q[18], q[12];
cx q[13], q[14];
cx q[11], q[18];
