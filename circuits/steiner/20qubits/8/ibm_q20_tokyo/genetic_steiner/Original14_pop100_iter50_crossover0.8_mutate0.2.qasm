// Initial wiring: [6, 15, 2, 14, 11, 8, 1, 18, 10, 12, 0, 4, 13, 19, 16, 7, 5, 3, 9, 17]
// Resulting wiring: [6, 15, 2, 14, 11, 8, 1, 18, 10, 12, 0, 4, 13, 19, 16, 7, 5, 3, 9, 17]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[1], q[0];
cx q[13], q[12];
cx q[19], q[18];
cx q[18], q[12];
cx q[17], q[18];
cx q[13], q[15];
cx q[11], q[12];
cx q[3], q[6];
