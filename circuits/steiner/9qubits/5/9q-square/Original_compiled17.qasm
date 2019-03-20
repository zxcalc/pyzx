// Initial wiring: [0 4 2 3 7 5 6 1 8]
// Resulting wiring: [0 7 2 3 5 4 6 1 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[3], q[4];
cx q[1], q[0];
cx q[7], q[4];
cx q[7], q[4];
cx q[7], q[4];
cx q[4], q[5];
cx q[4], q[5];
cx q[4], q[5];
cx q[3], q[4];
cx q[0], q[5];
cx q[7], q[4];
