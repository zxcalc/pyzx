// Initial wiring: [1 0 2 7 3 5 6 4 8]
// Resulting wiring: [1 0 2 7 3 6 5 4 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[6], q[5];
cx q[5], q[0];
cx q[5], q[6];
cx q[5], q[6];
cx q[5], q[6];
cx q[0], q[5];
cx q[1], q[4];
cx q[3], q[2];
