// Initial wiring: [0 2 3 1 7 4 6 5 8]
// Resulting wiring: [0 2 3 1 7 4 6 5 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[4], q[3];
cx q[6], q[7];
cx q[1], q[4];
cx q[0], q[5];
cx q[7], q[4];
