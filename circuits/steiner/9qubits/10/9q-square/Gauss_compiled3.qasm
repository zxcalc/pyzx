// Initial wiring: [7 1 2 5 3 0 6 4 8]
// Resulting wiring: [7 4 2 1 3 0 8 5 6]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[0], q[1];
cx q[6], q[5];
cx q[4], q[5];
cx q[4], q[3];
cx q[0], q[5];
cx q[4], q[5];
cx q[4], q[5];
cx q[4], q[5];
cx q[7], q[8];
cx q[7], q[8];
cx q[7], q[8];
cx q[6], q[5];
cx q[7], q[4];
cx q[7], q[6];
cx q[7], q[6];
cx q[6], q[5];
cx q[7], q[8];
cx q[7], q[8];
cx q[7], q[8];
cx q[1], q[4];
cx q[1], q[4];
cx q[7], q[6];
cx q[7], q[4];
