// Initial wiring: [0 1 2 5 4 3 6 7 8]
// Resulting wiring: [0 1 2 5 4 3 6 7 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[7], q[6];
cx q[5], q[6];
cx q[2], q[3];
