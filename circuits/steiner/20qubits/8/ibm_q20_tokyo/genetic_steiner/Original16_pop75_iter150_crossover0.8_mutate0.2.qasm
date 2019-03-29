// Initial wiring: [2, 19, 13, 16, 15, 9, 10, 0, 4, 17, 6, 5, 8, 14, 12, 3, 11, 7, 18, 1]
// Resulting wiring: [2, 19, 13, 16, 15, 9, 10, 0, 4, 17, 6, 5, 8, 14, 12, 3, 11, 7, 18, 1]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[7], q[1];
cx q[11], q[8];
cx q[15], q[13];
cx q[16], q[14];
cx q[18], q[12];
cx q[11], q[18];
cx q[6], q[13];
cx q[4], q[5];
